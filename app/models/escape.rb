class Escape < ActiveRecord::Base
  attr_accessible :location, :phone, :price, :street, :title

  def self.active
    where("expiration > ? OR expiration IS ?", Time.now.strftime("%B %d, %Y").to_date, "")
  end

end
