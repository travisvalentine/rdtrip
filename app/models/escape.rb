class Escape < ActiveRecord::Base
  attr_accessible :location, :phone, :price, :street, :title

  after_create :find_nearest_metro

  geocoded_by :address

  # include Tire::Model::Search
  # include Tire::Model::Callbacks

  def self.active
    where("expiration > ? OR expiration IS ?", Time.now.strftime("%B %d, %Y").to_date, "")
  end

  # def self.search(params)
  #   tire.search do
  #     query { string params[:query] if params[:query].present?}
  #   end
  # end

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
