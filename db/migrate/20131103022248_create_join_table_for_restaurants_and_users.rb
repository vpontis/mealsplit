class CreateJoinTableForRestaurantsAndUsers < ActiveRecord::Migration
  def change
    create_join_table :restaurants, :users
  end
end
