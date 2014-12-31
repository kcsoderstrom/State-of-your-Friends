class User < ActiveRecord::Base
  has_many :responses
  has_many :friendships
  has_many :friends, through: :friendships, source: :friend

  after_initialize :ensure_session_token
  include BCrypt
  
  def self.facebook_make(options)
    user = User.find_by(uid: options[:uid], provider: options[:provider])

    unless user
      user = User.new(options)
      user.survey_id = 1
      #TODO: Set this based on friends' questions.
      #TODO: Add friends to the database using the User::friends method.
    end

    user.facebook_token = options[:facebook_token]
    user.save
    user.add_friends
    user
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

  def survey
  	Question.where(survey_id: survey_id)
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
