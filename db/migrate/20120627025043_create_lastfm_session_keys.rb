class CreateLastfmSessionKeys < ActiveRecord::Migration
  def change
    create_table :lastfm_session_keys do |t|
    	t.string :token
    	t.integer :user_id

      t.timestamps
    end
  end
end
