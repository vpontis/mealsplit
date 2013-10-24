class MealsController < ApplicationController
  def new
    @meal = Meal.new
  end

  def restaurant_choice
    restaurant_name = params[:restaurant_name]
    redirect_to '/get_participants'
  end

  def get_participants
    
  end

  def participants_list

  end

  def index
    @autocomplete_items = Meal.all
  end

  #def load_suggestions
   # @suggestions = Restaurant.select(:name) or Restaurant.find(:all, conditions: [...])
   # render json: @suggestions
  #end
end
