# primary author: Vic
class ParticipantsController < ApplicationController
  before_filter :get_meal_and_participant, only: [:edit, :update, :destroy, :destroy_food_item, :create]
  before_filter :get_meal,                 only: [:index]
  before_filter :meal_valid,               only: [:edit, :update, :destroy, :destroy_food_item]
  before_filter :can_view_meal

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
      # here we are taking user input and inserting it into the flash, thus the flash needs to be sanitized before displayed
      # this happens automatically with rails and should not be disabled
      flash[:danger] = "Sorry we were not able to find the food item #{params[:new_food_item]} at the restaurant."
    else
      @participant.food_items << @food_item
      @participant.processed = true
      @participant.save
    end
    respond_to do |format|
      format.js {
        render partial: 'add_food_item', food_item: @food_item
      }
      format.json {
        render json: food_item
      }
      format.html {
        redirect_to edit_meal_participant_path(@meal, @participant)
      }
    end
  end

  def create
    @meal = Meal.find(params[:meal_id])

    if params[:new_meal_participant].blank?
      flash[:danger] = "You have to enter in a vaild email."
      redirect_to meal_participants_path(@meal)
      return
    end

    @new_participant = @meal.participants.build(email: params[:new_meal_participant])
    if !@new_participant.save
      flash[:danger] = "Sorry #{params[:new_meal_participant]} is not a valid email."
      redirect_to meal_participants_path(@meal)
      return
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
    @participant = @meal.participants.find_by(id: params[:id])
    @restaurant = @meal.restaurant
  end

  def get_meal
    @meal = Meal.find(params[:meal_id])
    @restaurant = @meal.restaurant
  end

  def meal_valid
    @meal = Meal.find(params[:meal_id])
    # if @meal.payer.nil? 
    #   flash[:danger] = 'The meal must have a payer before you edit participants food items.'
    #   redirect_to meal_participants_path(@meal)
    # end
    if  @meal.participants.count < 2
      flash[:danger] = 'The meal must have at least two participants. You can\'t share with yourself'
      redirect_to meal_participants_path(@meal)
    end
  end

  def can_view_meal
    if session[:meal_id] == params[:meal_id].to_i
      return
    end
    if !current_user.nil? 
      current_user.meals.each do |meal|
        if meal.id == params[:meal_id].to_i
          return
        end
      end
    end
    flash[:danger] = 'Sorry you cannot view this meal.'
    redirect_to root_path
  end
end
