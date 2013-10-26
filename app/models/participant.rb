class Participant < ActiveRecord::Base
  def new

  end

  def edit
    logger.debug "HEREE"
    logger.debug params
    # meal = Meal.find(params[:meal_id])
    # logger.debug meal
    # @participant = meal.participants.find(params[:id])
  end
end
