class SongsController < ApplicationController

  def show
    @escape = Escape.find(params[:escapes])
  end

  def index
    @escape = Escape.find(params[:escapes])
    @metro = Metro.find_by_name(@escape.nearest_metro)
    @json = Metro.all.to_gmaps4rails
  end

end
