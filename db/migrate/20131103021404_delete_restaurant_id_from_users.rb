class DeleteRestaurantIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :restaurant_user
  end
end
