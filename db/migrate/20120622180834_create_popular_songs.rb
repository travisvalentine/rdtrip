class CreatePopularSongs < ActiveRecord::Migration
  def change
    create_table :popular_songs do |t|
      t.string      :artist
      t.string      :title
      t.string      :url
      t.integer     :metro_id

      t.timestamps
    end
  end
end
