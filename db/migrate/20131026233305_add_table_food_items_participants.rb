class AddTableFoodItemsParticipants < ActiveRecord::Migration
  def change
    create_join_table :food_items, :participants
  end
end
