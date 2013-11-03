# primary author: Ty
class Participant < ActiveRecord::Base
  belongs_to :meal
  # belongs_to :user
  has_and_belongs_to_many :food_items
  validates_email_format_of :email

  def subtotal
    self.food_items.reduce(0) {|sum, food_item| sum + food_item.cost}
  end

  def tax
    self.meal.tax * subtotal
  end

  def tip
    if meal.tip_percent.nil? 
      nil
    else
      self.subtotal * meal.tip_percent
    end
  end

  def total
    subtotal+tax
  end

  def participant_user
    # once participants have user_id's this top line will work, for now use email
    # User.find(self.user_id)
    User.find_by(email: self.email)
  end

  def name
    if self.participant_user.nil?
      nil
    else
      self.participant_user.name
    end
  end
end
