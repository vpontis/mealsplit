# primary author: Ty
class Participant < ActiveRecord::Base
  has_and_belongs_to_many :food_items
  validates_email_format_of :email

  def subtotal
    self.food_items.reduce(0) {|sum, food_item| sum + food_item.cost}
  end

  def tax
    # all of the restaurants we have loaded now have a tax rate of 6.5%
    # in the future we will be associating a tax with a restaurant
    0.065*subtotal
  end

  def tip(percent) 
    tip_percentage = percent.to_f/100
    tip_percentage * subtotal.to_f/100
  end

  def total
    subtotal+tax
  end
end
