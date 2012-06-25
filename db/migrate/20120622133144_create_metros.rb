class CreateMetros < ActiveRecord::Migration
  def change
    create_table :metros do |t|
      t.string  :country
      t.string  :name
      t.string  :name_formatted
      t.string  :country_formatted
      t.float   :latitude
      t.float   :longitude

      t.timestamps
    end
  end
end
