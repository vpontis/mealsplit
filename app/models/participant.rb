class Participant < ActiveRecord::Base
  has_and_belongs_to_many :food_items

  def owes
    self.food_items.reduce(0) {|sum, food_item| sum + food_item.cost}
  end
end
