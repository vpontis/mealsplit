class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.integer :restaurant_id
      t.integer :meal_payer_id

      t.timestamps
    end
  end
end
