class MealsController < ApplicationController
  before_filter :meal_complete,    only: [:show]


  def new
    @meal = Meal.new
  end

  def show
    @meal = Meal.find(params[:id])
    @restaurant = Restaurant.find(@meal.restaurant_id)
  end

  def create
    restaurant = Restaurant.find_by(name: params[:restaurant_name])
    if restaurant.nil?
      flash[:danger] = "You need to choose the name of a restaurant in the database. Try Chipotle or Flour."
      redirect_to new_meal_path
    else
      @meal = Meal.new
      @meal.restaurant_id = restaurant.id
      @meal.save
      redirect_to meal_participants_path(@meal)
    end
  end

  def tax_and_tip
  end

  def complete_meal
    # send a payment request to each email in the list of participants
    meal = Meal.find(params[:id])
    participants = meal.participants
    participants.each do |participant|
      if !participant.payer
        send_payment_request(participant, meal)
      end
    end
    redirect_to root_path
  end

  def index
    @meals = Meal.all
  end

  private
    def send_payment_request(participant, meal)
      UserMailer.payment_request_email(participant, meal).deliver
    end  

    def meal_complete
      @meal = Meal.find(params[:id])
      if @meal.unprocessed_participants.count != 0
        flash[:danger] = "All of the participants must have a food item before you can view the meal summary."
        redirect_to meal_participants_path(@meal)
      end
    end
end
