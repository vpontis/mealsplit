# primary author: Em
class FoodItem < ActiveRecord::Base
  belongs_to :restaurant
  has_and_belongs_to_many :participants

  validates :name, length: {minimum: 5}
  validates :cost, presence: true

  def cost_pretty 
  	'$' + '%.2f' % self.cost
  end
end


