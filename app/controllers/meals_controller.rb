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

  def update
    # send a payment request to each email in the list of participants
    meal = Meal.find(params[:id])
    meal.tip_percent = params[:meal][:tip_percent].to_i
    meal.save
    meal.participants.each do |participant|
      if !participant.payer
        send_payment_request(participant, meal)
      elsif participant.payer
        send_leader_summary(meal)
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

  private
    def send_leader_summary(meal)
      UserMailer.leader_summary_email(meal)
    end
end
