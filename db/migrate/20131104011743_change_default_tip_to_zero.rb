class ChangeDefaultTipToZero < ActiveRecord::Migration
  def change
    change_column_default :meals, :tip_percent, 0
  end
end
