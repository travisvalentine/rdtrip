class AddUpAndDownVotesToEscapes < ActiveRecord::Migration
  def change
    add_column :escapes, :upvotes, :integer, :default => 1
    add_column :escapes, :downvotes, :integer, :default => 1
  end
end
