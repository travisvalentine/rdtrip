class EscapesController < ApplicationController

  def index
    @escapes = Escape.active
  end

  def show
    @escape = Escape.find(params[:id])
    @metro = Metro.find_by_name(@escape.nearest_metro)
    @json = Metro.all.to_gmaps4rails
  end

private
  
  def get_lastfm_auth_token
    lastfm = Lastfm.new(LAST_FM_API_KEY, LAST_FM_SECRET_KEY)
    token = lastfm.auth.get_token
    user_id = current_user.id
    temp_auth_token = LastfmAuthToken.from_before_filter(token, user_id)
  end

end
