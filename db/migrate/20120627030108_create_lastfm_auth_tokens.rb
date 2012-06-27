class CreateLastfmAuthTokens < ActiveRecord::Migration
  def change
    create_table :lastfm_auth_tokens do |t|
    	t.string :token
    	t.integer :user_id

      t.timestamps
    end
  end
end
