class CreateRdioTracks < ActiveRecord::Migration
  def change
    create_table :rdio_tracks do |t|
    	t.string :artist
    	t.string :title
    	t.string :rdio_id
    	t.integer :playlist_id

      t.timestamps
    end
  end
end
