class Meal < ActiveRecord::Base
  has_one :restaurant
  has_many :participants

  def next_participant_path
    participant = self.unprocessed_participants.first
    if !participant.nil?
      edit_meal_participant_path(self, participant)
    else
      meal_summary_path(self)
    end
  end

  def unprocessed_participants
    self.participants.where(processed: false)
  end

private
  def edit_meal_participant_path(meal, participant)
    "/meals/#{meal.id}/participants/#{participant.id}/edit"
  end

  def meal_summary_path(meal)
    "/meals/#{meal.id}/summary"
  end
end
