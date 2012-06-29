class RdioTrack < ActiveRecord::Base
  attr_accessible :artist, :title, :rdio_id
  belongs_to :playlist

end
