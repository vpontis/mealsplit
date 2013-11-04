# primary author: Vic
class MealsController < ApplicationController
  before_filter :meal_complete,    only: [:show]
  before_filter :signed_in,        only: [:index]
  before_filter :can_view_meal,    only: [:show]

  # make sure other people cannot see meals created in the past

  def index
    @meals = current_user.meals
  end

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
      @meal = Meal.new(restaurant: restaurant)
      @meal.save
      session[:meal_id] = @meal.id
      redirect_to meal_participants_path(@meal)
    end
  end

  def update
    @meal = Meal.find(params[:id])
    payer = @meal.participants.find_by("email = ?", params[:meal][:payer_email])
    if payer.nil?
      flash[:danger] = "You must select a payer before proceeding."
      redirect_to meal_path(@meal)
      return
    else
      @meal.payer= payer
      payer.payer = true
      payer.save
    end

    @meal.tip_percent = params[:meal][:tip_percent].to_f
    @meal.save

    @meal.participants.each do |participant|
      logger.debug 'hellooooooooooo'
      logger.debug participant.payer
      logger.debug participant.email
      if participant.id != @meal.payer_id
        send_payment_request(participant, @meal)
      else
        send_payer_summary(@meal)
      end
    end
    redirect_to '/thank_you'
  end

private
  def send_payment_request(participant, meal)
    UserMailer.payment_request_email(participant, meal).deliver
  end  

  def send_payer_summary(meal)
    UserMailer.payer_summary_email(meal).deliver
  end

  def meal_complete
    @meal = Meal.find(params[:id])
    if @meal.unprocessed_participants.count != 0 || @meal.participants.count == 0
       flash[:danger] = "All of the participants must have a food item before you can view the meal summary."
       redirect_to meal_participants_path(@meal)
    end
  end

  def signed_in
    if current_user.nil?
      flash[:danger] = 'You need to be signed in to view past meals.'
      redirect_to root_path
    end
  end

  def can_view_meal
    if session[:meal_id] == params[:id].to_i
      return
    end
    if !current_user.nil? 
      current_user.meals.each do |meal|
        if meal.id == params[:id].to_i
          return
        end
      end
    end
    flash[:danger] = 'Sorry you cannot view this meal.'
    redirect_to root_path
  end
end
