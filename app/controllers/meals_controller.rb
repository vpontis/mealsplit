class MealsController < ApplicationController
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
      redirect_to '/get_participants'
    end
  end

  def get_participants
    if cookies[:restaurant_name].nil?
      flash[:danger] = "You need to choose a restaurant before you choose particpants."
      redirect_to root_path
    end
    @restaurant_name = cookies[:restaurant_name]
  end

  def participants_list
    
  end

  def index
  end

  def load_suggestions
      @suggestions = Restaurant.select(:name) or Restaurant.find(:all)
      render json: @suggestions
  end
end
