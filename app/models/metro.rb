class Metro < ActiveRecord::Base
  attr_accessible :name, :country, :latitude, :longitude

  geocoded_by :name

  after_validation :geocode

  has_many :popular_songs
  has_many :unique_songs

  acts_as_gmappable :process_geocoding => false

  def gmaps4rails_address
    "#{self.name}, #{self.city}"
  end

end
