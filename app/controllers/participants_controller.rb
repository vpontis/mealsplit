class ParticipantsController < ApplicationController
  def new

  end

  def edit
    @meal = Meal.find(params[:meal_id])
    @restaurant = Restaurant.find(@meal.restaurant_id)
    @participant = @meal.participants.find(params[:id])
  end

  def update
  end

  def create
    @meal = Meal.find(params[:meal_id])
    if params[:new_meal_participant].blank?
      flash[:danger] = "You have to enter in an email."
      redirect_to meal_participants_path(@meal)
      return
    end
    @new_participant = @meal.participants.build(email: params[:new_meal_participant])
    @new_participant.save
    redirect_to meal_participants_path(@meal)
  end

  def index
    @meal = Meal.find(params[:meal_id])
    @restaurant = Restaurant.find(@meal.restaurant_id)
    @new_participant = @meal.participants.new
  end

  def destroy
    @meal = Meal.find(params[:meal_id])
    @participant = @meal.participants.find(params[:id])
    @participant.destroy
    redirect_to meal_participants_path(@meal)
  end
end
