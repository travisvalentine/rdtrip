class InfoController < ApplicationController
  before_filter :check_presence_of_current_user

  def home
  	@escapes = Escape.all
  end

end