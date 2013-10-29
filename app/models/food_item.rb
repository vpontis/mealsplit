# primary author: Em
class FoodItem < ActiveRecord::Base
  has_one :restaurant
  has_and_belongs_to_many :participants

  def cost_pretty 
  	'$' + '%.2f' % self.cost
  end
end


