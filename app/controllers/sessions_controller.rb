class SessionsController < ApplicationController
	before_filter :check_presence_of_current_user, :only => :new

	def new
	end

  def create
		user = User.from_omniauth(env['omniauth.auth'])
		session[:user_id] = user.id
		if user.lastfm_auth_token.nil?
			redirect_to lastfm_path, notice: "Signed in."
		else
			redirect_to escapes_path, notice: "Signed in."
		end
  end

  def destroy
		session[:user_id] = nil
		redirect_to root_url, notice: "Logged out."
  end
end
