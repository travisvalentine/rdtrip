class EscapesController < ApplicationController

  def index
    @escapes = Escape.search(params)
  end

end
