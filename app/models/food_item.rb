class FoodItem < ActiveRecord::Base
  has_one :restaurant
  has_and_belongs_to_many :participants

  def cost_pretty 
  	'$' + '%.2f' % cost_decimal
  end

  def cost_decimal
  	self.cost.to_f/100
  end
end


