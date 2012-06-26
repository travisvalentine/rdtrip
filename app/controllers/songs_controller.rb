class SongsController < ApplicationController

  def index
    @escape = Escape.find(params[:escapes])
    @metro = Metro.find_by_name(@escape.nearest_metro)
    @json = Metro.all.to_gmaps4rails
  end

end
