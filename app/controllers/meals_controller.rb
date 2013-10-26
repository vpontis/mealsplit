class MealsController < ApplicationController
  before_action :restaurant_chosen, only: [:get_participants, :participants_list] 

  def new
    @meal = Meal.new
  end

  def create
    restaurant = Restaurant.find_by(name: params[:restaurant_name])
    if restaurant.nil?
      flash[:danger] = "You need to choose the name of an existing restaurant."
      redirect_to new_meal_path
    else
      @meal = Meal.new
      @meal.restaurant_id = restaurant.id
      @meal.save
      redirect_to meal_participants_path(@meal)
    end
  end

  def meal_summary
    @restaurant_name = cookies[:restaurant_name]
    meal_id = params[:id]
    @participants = Meal.find(meal_id).participants
  end

  def complete_meal
    # send a payment request to each email in the list of participants
    redirect_to root_path
  end

  def index
  end


  private
    def restaurant_chosen
      if cookies[:restaurant_name].nil? || cookies[:restaurant_id].nil?
        flash[:danger] = "You need to choose a restaurant before you choose particpants."
        redirect_to root_path
      end
    end

  private
    def send_payment_request(email, amount, leader, restaurant)
      UserMailer.payment_request_email(email, amount, leader, restaurant).deliver
    end
end
