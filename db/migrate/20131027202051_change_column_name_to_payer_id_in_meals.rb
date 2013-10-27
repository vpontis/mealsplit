class ChangeColumnNameToPayerIdInMeals < ActiveRecord::Migration
  def change
    rename_column :meals, :meal_payer_id, :payer_id
  end
end
