# primary author: Vic
class Meal < ActiveRecord::Base
  validates :restaurant, presence: true

  belongs_to :restaurant
  has_many :participants

  def next_participant
    self.unprocessed_participants.first
  end

  def unprocessed_participants
    self.participants.select {|participant| participant.food_items.count==0}
  end

  def payer=(payer)
    self.payer_id = payer.id

    self.participants.each do |par|
      if par.id != payer.id
        par.payer = false
        par.save
      end
    end
    payer.payer = true
    payer.save

    self.save
  end

  def payer
    return nil if self.payer_id == nil
    meal_payer = self.participants.find_by(id: self.payer_id)
    if meal_payer == nil
      self.payer_id = nil
      self.save
    else
      meal_payer
    end
  end

  def tax
    self.restaurant.tax
  end
end
