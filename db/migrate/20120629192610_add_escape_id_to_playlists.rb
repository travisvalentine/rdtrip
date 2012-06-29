class AddEscapeIdToPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :escape_id, :integer
  end
end
