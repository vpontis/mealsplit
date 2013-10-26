class ParticipantsController < ApplicationController
  def new

  end

  def edit
    @meal = Meal.find(params[:meal_id])
    @participant = @meal.participants.find(params[:id])
  end
end
