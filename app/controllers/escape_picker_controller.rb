class EscapePickerController < ApplicationController

	def create
	  @escape = Escape.find(params[:escape_id])
	  redirect_to escape_path(@escape, :city => params[:city],
	  																 :state => params[:state])
	end

end
