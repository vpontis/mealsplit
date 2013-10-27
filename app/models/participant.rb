class Participant < ActiveRecord::Base
  has_and_belongs_to_many :food_items
  validates :email, email_format: { message: "doesn't look like an email address" }

  def owes
    self.food_items.reduce(0) {|sum, food_item| sum + food_item.cost}
  end
end
