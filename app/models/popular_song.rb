class PopularSong < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :metro
end
