class LastfmSessionKey < ActiveRecord::Base
  belongs_to :user

  def self.from_before_filter(session_key, user_id)
  	user = User.find(user_id)
  	if user.lastfm_session_key.nil?
	    create! do |user_session|
	      user_session.token = session_key
	      user_session.user_id = user_id
	    end
		else
			temp_token = LastfmSessionKey.find_by_user_id(user_id)
			temp_token.token = session_key
			temp_token.save
	  end
  end

end