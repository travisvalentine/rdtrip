class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :prepare_for_mobile

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

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end
  helper_method :mobile_device?

  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    request.format = :mobile if mobile_device?
  end

end