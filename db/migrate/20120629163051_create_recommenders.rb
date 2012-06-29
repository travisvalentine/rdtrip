class CreateRecommenders < ActiveRecord::Migration
  def change
    create_table :recommenders do |t|

      t.timestamps
    end
  end
end
