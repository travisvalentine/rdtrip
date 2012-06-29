class EscapesController < ApplicationController
  before_filter :store_lastfm_session_key, :only => :index

  def index
    @escapes = Escape.active
  end

  def show
    @escape = Escape.find(params[:id])
    @metro = Metro.find_by_name(@escape.nearest_metro)
    # @playlist_song = @metro.unique_songs.first
    # @playlist = UniqueSong.make_playlist_from(@playlist_song, current_user.id)
  end

  def escapes_lat_long
    render json: Escape.all.map{ |e| { :title => e.title,
                                       :price => e.price,
                                       :city => e.city_escaped,
                                       :state => e.state,
                                       :latitude => e.latitude,
                                       :longitude => e.longitude } }
  end

private
  
  def store_lastfm_session_key
    if current_user && request.referer == nil && current_user.lastfm_session_key.nil?
      lastfm = Lastfm.new(LAST_FM_API_KEY, LAST_FM_SECRET_KEY)
      token = current_user.lastfm_auth_token.token
      lastfm.session = lastfm.auth.get_session(token)['key']
      LastfmSessionKey.from_before_filter(lastfm.session, current_user.id)
    end
  end

end
