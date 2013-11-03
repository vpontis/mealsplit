# primary author: Vic
class RestaurantsController < ApplicationController
  # filter who can access a restaurant page
  before_filter :get_restaurant,          only: [:show, :update, :destroy, :destroy_food_item]

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(
        name: params[:restaurant][:name],
        city: params[:restaurant][:city]
      )
    if @restaurant.save
      flash[:success] = "We have created #{@restaurant.name}"
      redirect_to restaurants_path
    else
      flash[:danger] = @restaurant.errors.full_messages.first
      render 'new'
    end
  end

  def index
    @restaurants = Restaurant.all
  end

  def show
    @food_item = @restaurant.food_items.new
  end

  def update
    @food_item = @restaurant.food_items.new(name: params[:food_item][:name], cost: params[:food_item][:cost])
    if @food_item.save
      redirect_to restaurant_path(@restaurant)
    else
      flash[:danger] = @food_item.errors.full_messages.first
      render 'show'
    end
  end

  def destroy 
    if @restaurant.destroy
      flash[:success] = "Deleted #{@restaurant.name}"
    else
      flash[:danger] = "Unable to delete specified restaurant"
    end
    redirect_to restaurants_path
  end

  def restaurant_suggestions
    @suggestions = Restaurant.select(:name) or Restaurant.find(:all)
    @suggestions.map! { |s| s.name.gsub("'", "") }
    render json: @suggestions
  end

  def destroy_food_item
    @restaurant = Restaurant.find(params[:id])
    @food_item = @restaurant.food_items.find(params[:food_item_id])
    if @food_item.nil?
      flash[:danger] = "Sorry we cannot find your specified food item."
    else
      @food_item.destroy
    end
    redirect_to restaurant_path(@restaurant)
  end

  def food_item_suggestions
    restaurant = Restaurant.find(params[:restaurant_id]) unless params[:restaurant_id].nil?
    if restaurant.nil?
      @suggestions = []
    else
      @suggestions = restaurant.food_items.all
      @suggestions.map! { |s| s.name.gsub("'", "") }
    end
    render json: @suggestions
  end

private
  def get_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
