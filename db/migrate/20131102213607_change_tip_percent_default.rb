class ChangeTipPercentDefault < ActiveRecord::Migration
  def change
  	change_column_default(:meals, :tip_percent, 0.15)
  end
end
