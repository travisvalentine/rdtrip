class ApplicationController < ActionController::Base
  protect_from_forgery

private

  def check_presence_of_current_user
    if current_user
      redirect_to escapes_path
    end
  end
  helper_method :check_presence_of_current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

end
