class EscapesController < ApplicationController

  def index
    @escapes = Escape.active
  end

  def show
    @escape = Escape.find(params[:id])
    @metro = Metro.find_by_name(@escape.nearest_metro)
    if @metro.unique_songs != []
      @artist = @metro.unique_songs.first.artist
      @playlist = @escape.playlist ? @escape.playlist : Playlist.build_from_artist(@artist, @escape)
    end
  end

  def escapes_lat_long
    render json: Escape.all.map{ |e| { :title => e.title,
                                       :price => e.price,
                                       :city => e.city_escaped,
                                       :state => e.state,
                                       :latitude => e.latitude,
                                       :longitude => e.longitude } }
  end

end
