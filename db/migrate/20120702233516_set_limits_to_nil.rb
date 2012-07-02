class SetLimitsToNil < ActiveRecord::Migration
  change_column :escapes, :details, :text, :limit => nil
  change_column :popular_songs, :url, :text, :limit => nil
  change_column :unique_songs, :url, :text, :limit => nil
end
