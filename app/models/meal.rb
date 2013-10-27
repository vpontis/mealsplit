class Meal < ActiveRecord::Base
  has_one :restaurant
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
  
  def summary_path
    "/meals/#{self.id}/summary"
  end

private
  def edit_meal_participant_path(meal, participant)
    "/meals/#{meal.id}/participants/#{participant.id}/edit"
  end
end
