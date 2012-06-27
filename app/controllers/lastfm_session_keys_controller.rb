class LastfmSessionKeysController < ApplicationController

  def create
    user_id = current_user.id
    lastfm_session_key = LastfmSessionKey.from_callback(params, user_id)
    redirect_to escapes_path, notice: "Connected with Lastfm!"
  end

end
