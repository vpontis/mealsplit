class ParticipantsController < ApplicationController
  before_filter :get_meal_and_participant, only: [:edit, :update, :destroy, :destroy_food_item]
  before_filter :get_meal,                 only: [:index]

  def new
  end

  # this page allows you to add food items to a participant
  def edit
    @food_item = @participant.food_items.new
  end

  # posts to here should add a food item to a participant
  def update
    @food_item = @restaurant.food_items.find_by(name: params[:new_food_item])
    if @food_item.nil?
      flash[:danger] = "Sorry we were not able to find the food item #{params[:new_food_item]} at the restaurant."
    else
      @participant.food_items << @food_item
      @participant.processed = true
      @participant.save
    end
    redirect_to edit_meal_participant_path(@meal, @participant)
  end


  def create
    if params[:new_meal_participant].valid? 
      flash[:danger] = "You have to enter in a vaild email."
      redirect_to meal_participants_path(@meal)
      return
    end
    @new_participant = @meal.participants.build(email: params[:new_meal_participant])
    @new_participant.save
    if params[:payer].to_i == 1
      @new_participant.payer = true
      @meal.payer= @new_participant
    end
    @new_participant.save
    redirect_to meal_participants_path(@meal)
  end

  def index
    @new_participant = @meal.participants.new
  end

  def destroy
    @participant.destroy
    redirect_to meal_participants_path(@meal)
  end

  def destroy_food_item
    @food_item = @participant.food_items.find(params[:food_item_id])
    @participant.food_items.delete(@food_item)
    @participant.save
    redirect_to edit_meal_participant_path(@meal, @participant)
  end

private
  def get_meal_and_participant
    @meal = Meal.find(params[:meal_id])
    @participant = @meal.find_by(id: params[:id])
    @restaurant = @meal.restaurant
  end

  def get_meal
    @restaurant = @meal.restaurant
    @restaurant = @meal.restaurant
  end
end
