class AddTipPercentToMeal < ActiveRecord::Migration
  def change
    add_column :meals, :tip_percent, :integer, :default => 15
  end
end
