class LastfmAuthToken < ActiveRecord::Base
  attr_accessible :token, :user_id
  belongs_to :user


  def self.from_before_filter(token, user_id)
  	user = User.find(user_id)
  	if user.lastfm_auth_token.nil?
	    create! do |temp_token|
	      temp_token.token = params["token"]
	      temp_token.user_id = user_id
	    end
		else
			temp_token = LastfmAuthToken.find_by_user_id(user_id)
			temp_token.token = token
			temp_token.save
		end
  end

end
