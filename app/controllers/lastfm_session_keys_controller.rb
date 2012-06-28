class LastfmSessionKeysController < ApplicationController
	before_filter :get_lastfm_auth_token, :only => :new

	def new		
	end

  def create
    user_id = current_user.id
    lastfm_session_key = LastfmSessionKey.from_callback(params, user_id)
    redirect_to escapes_path, notice: "Connected with Lastfm!"
  end

private
  
  def get_lastfm_auth_token
    lastfm = Lastfm.new(LAST_FM_API_KEY, LAST_FM_SECRET_KEY)
    token = lastfm.auth.get_token
    LastfmAuthToken.from_before_filter(token, current_user.id)
  end

end