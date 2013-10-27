module ParticipantsHelper
  def destroy_food_item_path(meal, participant, food_item)
    "/meals/#{meal.id}/participants/#{participant.id}/destroy_food_item/#{food_item.id}"
  end 
end
