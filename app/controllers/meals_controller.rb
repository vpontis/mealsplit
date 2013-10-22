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

  def particpants_list

  end
end
