class ParticipantsController < ApplicationController
  def new

  end

  def edit
    @meal = Meal.find(params[:meal_id])
    @restaurant = Restaurant.find(@meal.restaurant_id)
    @participant = @meal.participants.find(params[:id])
    @food_item = @participant.food_items.new
  end

  def update
    @meal = Meal.find(params[:meal_id])
    @participant = @meal.participants.find(params[:id])
    @restaurant = Restaurant.find(@meal.restaurant_id)
    @food_item = @restaurant.food_items.find_by(name: params[:new_food_item])
    @participant.food_items << @food_item
    @participant.processed = true
    @participant.save
    redirect_to edit_meal_participant_path(@meal, @participant)
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

  def destroy_food_item
    @meal = Meal.find(params[:meal_id])
    @participant = @meal.participants.find(params[:id])
    @food_item = @participant.food_items.find(params[:food_item_id])
    @participant.food_items.delete(@food_item)
    @participant.save
    redirect_to edit_meal_participant_path(@meal, @participant)
  end
end
