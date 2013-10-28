class Participant < ActiveRecord::Base
  has_and_belongs_to_many :food_items
  validates_email_format_of :email

  def owes
    self.food_items.reduce(0) {|sum, food_item| sum + food_item.cost}
  end
end
