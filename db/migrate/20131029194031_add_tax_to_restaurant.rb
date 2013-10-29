class AddTaxToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :tax, :float, default: 0.065
  end
end
