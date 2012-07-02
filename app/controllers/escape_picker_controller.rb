class EscapePickerController < ApplicationController

	def create
	  @escape = Escape.find(params[:escape_id])
	  redirect_to escape_path(@escape)
	end

end
