class MealsController < ApplicationController
  before_action :restaurant_chosen, only: [:get_participants, :participants_list] 

  def new
    @meal = Meal.new
  end

  def restaurant_choice
    restaurant = Restaurant.find_by(name: params[:restaurant_name])
    if restaurant.nil?
      flash[:danger] = "You need to choose the name of an existing restaurant."
      redirect_to new_meal_path
    else
      cookies[:restaurant_name] = restaurant.name
      cookies[:restaurant_id] = restaurant.id
      redirect_to '/get_participants'
    end
  end

  def get_participants
    @restaurant_name = cookies[:restaurant_name]
  end

  def participants_list
    meal = Meal.new(restaurant_id: cookies[:restaurant_id].to_i)
    meal_payer = meal.participants.build(email: params[:meal_payer_name], payer: true)
    meal_payer.save
    meal.meal_payer_id = meal_payer.id
    params[:meal_participants].to_i.times do |i|
      meal.participants.build(email: params["meal_participant_#{i+1}"], payer: false).save
    end
    meal.save
    redirect_to edit_meal_participant_path(meal, meal_payer)
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
