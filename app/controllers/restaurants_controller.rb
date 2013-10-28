# primary author: Vic
class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(params[:restaurant])
  end

  def index
    @autocomplete_items = Restaurant.all
  end

  def restaurant_suggestions
    @suggestions = Restaurant.select(:name) or Restaurant.find(:all)
    @suggestions.map! { |s| s.name.gsub("'", "") }
    render json: @suggestions
  end

  def food_item_suggestions
    logger.debug "HELLLOOO"
    logger.debug params
    restaurant = Restaurant.find(params[:restaurant_id]) unless params[:restaurant_id].nil?
    if restaurant.nil?
      @suggestions = []
    else
      @suggestions = restaurant.food_items.all
      @suggestions.map! { |s| s.name.gsub("'", "") }
    end
    render json: @suggestions
  end
end
