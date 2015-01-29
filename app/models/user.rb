class User < ActiveRecord::Base
  has_many :responses
  has_many :friendships
  has_many :user_survey_questions
  has_many :user_proposed_questions
  has_many :friends, through: :friendships, source: :friend
  has_many :friend_responses, through: :friends, source: :responses
  has_many :survey_questions, through: :user_survey_questions, source: :question
  has_many :proposed_questions, through: :user_proposed_questions, source: :question
  has_many :suggested_questions, through: :friends, source: :proposed_questions
  has_one :current_question,
    class_name: "Question",
    foreign_key: :current_question_id

  after_initialize :ensure_session_token
  include BCrypt
  
  def self.facebook_make(options)
    user = User.find_by(uid: options[:uid], provider: options[:provider])

    unless user
      user = User.new(options)
      user.add_default_survey
    end

    user.facebook_token = options[:facebook_token]
    user.save
    user.add_friends
    user.add_questions
    user
  end

  def add_default_survey
    (1..5).each do |q_id|
      self.user_survey_questions.new(question_id: q_id)
    end
  end

  def self.generate_session_token
    SecureRandom.hex(16)
    #really should make sure this isn't being used.
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.update!(session_token: session_token)
  end

  def to_s
    self.profile.name
  end

  def add_friends
  	graph = Koala::Facebook::API.new(self.facebook_token)
  	friend_info = graph.get_connections("me", "friends")
  	friend_info.each do |info|
  		friend = User.find_by_uid(info["id"])
  		unless friends.include?(friend)
  			friendships.create(friend_id: friend.id)
  		end
  	end
  end

  def add_questions
  	suggested_questions.each do |q|
  		unless survey_questions.include?(q)
  			user_survey_questions.create(question_id: q.id)
  		end
  	end
  end

  def add_proposed_question(question)
  	user_proposed_questions.create(question_id: question.id)
  end

  def survey
  	survey_questions.where("user_survey_questions.is_deleted = FALSE")
  end

  def response_for_question(question_id)
  	response = Choice.find_by_sql(<<-SQL
  		SELECT
  			choices.*
  		FROM (
  			SELECT
  				*
  			FROM
	  			responses
	  		WHERE
	  			responses.user_id = #{id}
	  	) AS user_responses
  		INNER JOIN
  			choices
  		ON
  			user_responses.choice_id = choices.id
  		INNER JOIN
  			questions
  		ON
  			choices.question_id = questions.id
  		WHERE
  			questions.id = #{question_id}
  		LIMIT 1;
  	SQL
  	)

  	response.length > 0 ? response.first : nil
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
