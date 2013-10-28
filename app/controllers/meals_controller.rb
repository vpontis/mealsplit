class MealsController < ApplicationController
  before_action :restaurant_chosen, only: [:get_participants, :participants_list] 

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
      flash[:danger] = "You need to choose the name of an existing restaurant."
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
    def restaurant_chosen
      if cookies[:restaurant_name].nil? || cookies[:restaurant_id].nil?
        flash[:danger] = "You need to choose a restaurant before you choose participants."
        redirect_to root_path
      end
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
