class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.string :name
      t.string :twitter_id

      t.timestamps null: false
    end
  end
end
