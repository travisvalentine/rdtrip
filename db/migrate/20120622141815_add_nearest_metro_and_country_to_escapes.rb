class AddNearestMetroAndCountryToEscapes < ActiveRecord::Migration
  def change
    add_column :escapes, :nearest_metro, :string
    add_column :escapes, :country, :string
  end
end
