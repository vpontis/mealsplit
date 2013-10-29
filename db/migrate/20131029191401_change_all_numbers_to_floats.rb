class ChangeAllNumbersToFloats < ActiveRecord::Migration
  def change
    change_column :charges, :amount, :float
    change_column :food_items, :cost, :float
    change_column :meals, :tip_percent, :float
  end
end
