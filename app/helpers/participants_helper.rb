module ParticipantsHelper
  def destroy_food_item_path(meal, participant)
    "/meals/#{meal.id}/participants/#{participant.id}/destroy_food_item"
  end 
end
