class PlaylistsController < ApplicationController

	def new
		@playlist = Playlist.new
	end

	def show
		unless @playlist = Playlist.find(params[:id])
			head status: :bad_request
		end
	end

	def create

	end

end
