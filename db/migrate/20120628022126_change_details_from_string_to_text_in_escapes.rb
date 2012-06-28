class ChangeDetailsFromStringToTextInEscapes < ActiveRecord::Migration

	def self.up
   change_column :escapes, :details, :text
  end

  def self.down
   change_column :escapes, :details, :string
  end

end