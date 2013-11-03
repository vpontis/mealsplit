class AddRestaurantUserFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :restaurant_user, :boolean, default: false
  end
end
