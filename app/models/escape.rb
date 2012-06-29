class Escape < ActiveRecord::Base
  attr_accessible :location, :phone, :price, :street, :title

  after_create :find_nearest_metro

  geocoded_by :address

  has_one :playlist

  def self.active
    where("expiration > ? OR expiration LIKE ?", Time.now.strftime("%B %d, %Y").to_date, "")
  end

  def find_nearest_metro
    0.upto(1500) do |mile_radius|
      metro = Metro.near([self.latitude, self.longitude], mile_radius)
      if metro.count == 1
        set_metro_value_as(metro)
      end
    end
  end

  def set_metro_value_as(metro)
    self.nearest_metro = metro.first.name
    self.save
  end

  def address
    "#{latitude} #{longitude}"
  end

  def city_escaped
    self.city.gsub(" ","_").gsub("-","_")
  end

end
