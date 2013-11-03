# primary author: Em
class FoodItem < ActiveRecord::Base
  belongs_to :restaurant
  has_and_belongs_to_many :participants

  validate :name, length: {minimum: 5}
  validate :cost, presence: true

  def cost_pretty 
  	'$' + '%.2f' % self.cost
  end
end


