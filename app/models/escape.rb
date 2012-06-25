class Escape < ActiveRecord::Base
  attr_accessible :location, :phone, :price, :street, :title

  after_create :find_nearest_metro

  include Tire::Model::Search
  include Tire::Model::Callbacks

  def self.active
    where("expiration > ? OR expiration IS ?", Time.now.strftime("%B %d, %Y").to_date, "")
  end

  def self.search(params)
    tire.search do
      query { string params[:query] if params[:query].present?}
    end
  end

  def find_nearest_metro
    #for a given escape
    #compare the escape's lat/long to every Metro's lat/long
    #
    #metro
    #nearest_metro = [].sort.first
    #metro.
  end

end
