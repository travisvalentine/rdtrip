class ChangeUrlFromStringToText < ActiveRecord::Migration
	def self.up
   change_column :unique_songs, :url, :text
   change_column :popular_songs, :url, :text
  end

  def self.down
   change_column :unique_songs, :url, :string
   change_column :popular_songs, :url, :string
  end
end
