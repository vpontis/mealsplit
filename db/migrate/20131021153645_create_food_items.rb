class CreateFoodItems < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
      t.string :name
      t.integer :cost
      t.integer :restaurant_id
      t.timestamps
    end
  end
end
