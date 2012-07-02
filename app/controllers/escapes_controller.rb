class EscapesController < ApplicationController

  def update
    @escape = Escape.find(params[:id])
    if current_user
      express_desire_for_escape(@escape.id) if params[:upvote]
      express_disdain_for_escape(@escape.id) if params[:downvote]
    end
  end

  def index
    @location = request.location
    @escapes = Escape.active
  end

  def show
    @escape = Escape.find(params[:id])
    @metro = Metro.find_by_name(@escape.nearest_metro)
    if @metro.unique_songs != []
      @artist = @metro.unique_songs.first.artist
      @playlist = @escape.playlist ? @escape.playlist :
                  Playlist.build_from_artist(@artist, @escape)
    end
  end

  def escapes_lat_long
    render json: Escape.all.map{ |escape| { :title     => escape.title,
                                            :price     => escape.price,
                                            :city      => escape.city_escaped,
                                            :state     => escape.state,
                                            :latitude  => escape.latitude,
                                            :longitude => escape.longitude,
                                            :votes     => escape.votes } }
  end

end