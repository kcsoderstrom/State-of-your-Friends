# require 'net/http'

class User < ActiveRecord::Base
  has_many :responses


  after_initialize :ensure_session_token
  include BCrypt
  
  def self.facebook_make(options)
    user = User.find_by(uid: options[:uid], provider: options[:provider])

    unless user
      user = User.new(options)
      user.survey_id = 1
      #TODO: Set this based on friends' questions.
      #TODO: Add friends to the database using the User::friends method.
      user.save
    end

    user.facebook_token = options[:facebook_token]
    user.save
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

  def friends


		# url = URI.parse('https://graph.facebook.com/me?fields=friends.limit(5000)')
		# req = Net::HTTP::Get.new(url.to_s)
		# res = Net::HTTP.start(url.host, url.port) {|http|
		#   http.request(req)
		# }
		# res.body
		# , {access_token: self.facebook_token, limit: 5000}
  	# r = requests.request("GET", "https://graph.facebook.com/user/friends", )
  	# r.contents
    graph = Koala::Facebook::API.new(self.facebook_token)
    graph.get_connections("me", "friends")
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
