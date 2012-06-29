class ApplicationController < ActionController::Base
  protect_from_forgery

private

  def check_presence_of_current_user
    if current_user
      redirect_to escapes_path
    else
      redirect_to root_path unless request.fullpath == root_path
      flash[:notice] = "You must be signed in"
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def find_playlist
    @playlist ||= Playlist.find(params[:playlist_id])
  end

end
