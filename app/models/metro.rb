class Metro < ActiveRecord::Base
  attr_accessible :name, :country, :latitude, :longitude

  geocoded_by :address

  after_validation :geocode

  has_many :popular_songs
  has_many :unique_songs

  def address
    "#{self.name}, #{self.country}"
  end

end
