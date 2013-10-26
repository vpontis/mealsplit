class Meal < ActiveRecord::Base
  has_one :restaurant
  has_many :participants

  def next_participant
    self.participants.where(processed: false).first
  end
end
