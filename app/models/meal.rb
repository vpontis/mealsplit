class Meal < ActiveRecord::Base
  belongs_to :restaurant
  has_many :participants

  def next_participant_path
    participant = self.unprocessed_participants.first
    if !participant.nil?
      edit_meal_participant_path(self, participant)
    else
      self.summary_path
    end
  end

  def unprocessed_participants
    self.participants.where(processed: false)
  end

  def payer=(participant)
    self.payer_id = participant.id
    self.save
  end

  def payer
    return nil unless self.payer_id != nil
    meal_payer = self.participants.find_by(id: self.payer_id)
    if meal_payer == nil
      self.payer_id = nil
    else
      meal_payer
    end
  end
  
  def summary_path
    "/meals/#{self.id}/summary"
  end
private
  def edit_meal_participant_path(meal, participant)
    "/meals/#{meal.id}/participants/#{participant.id}/edit"
  end
end
