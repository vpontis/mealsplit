class FoodItem < ActiveRecord::Base
  has_one :restaurant
  has_and_belongs_to_many :participants

  def cost_pretty 
  	'$' + '%d' % (self.cost.to_f/100)
  	#{}"$"+(self.cost.to_f/100).round(2).to_s
  end

  def cost_decimal
  	self.cost.to_f/100
  end
end


