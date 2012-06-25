class CreateEscapes < ActiveRecord::Migration
  def change
    create_table :escapes do |t|
      t.string  :title
      t.string  :location
      t.string  :details
      t.string  :price 
      t.string  :phone
      t.string  :street
      t.string  :city
      t.string  :state
      t.string  :zipcode
      t.string  :expiration
      t.float   :latitude
      t.float   :longitude
      t.string  :nearest_metro
      t.string  :country

      t.timestamps
    end
  end
end