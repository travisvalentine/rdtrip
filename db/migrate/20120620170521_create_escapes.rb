class CreateEscapes < ActiveRecord::Migration
  def change
    create_table :escapes do |t|
      t.string :title
      t.string :location
      t.string :details
      t.string :price 
      t.string :phone
      t.string :street
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :expiration
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end