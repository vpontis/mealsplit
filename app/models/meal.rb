class Meal < ActiveRecord::Base
  has_one :restaurant
  has_many :participants

  def next_participant
    self.participants.find(processed: false) 
  end
end
