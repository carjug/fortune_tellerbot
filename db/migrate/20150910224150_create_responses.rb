class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :tweet

      t.timestamps null: false
    end
  end
end
