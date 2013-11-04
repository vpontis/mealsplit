# primary author: Vic
class RestaurantsController < ApplicationController
  # filter who can access a restaurant page
  before_filter :get_restaurant,                only: [:show, :update, :destroy, :destroy_food_item]
  before_filter :user_has_permission,           only: [:update, :destroy, :destroy_food_item]
  before_filter :check_admin,                   only: [:new, :create, :destroy]
  before_filter :manage_restaurant_permission,  only: [:show, :update, :destroy_food_item]

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(
        name: params[:restaurant][:name],
        city: params[:restaurant][:city]
      )
    if @restaurant.save
      # in this app we sometimes include variables in flashes, thus flashes need to be sanitized before they are rendered
      flash[:success] = "We have created #{@restaurant.name}"
      redirect_to restaurants_path
    else
      flash[:danger] = @restaurant.errors.full_messages.first
      render 'new'
    end
  end

  def index
    @restaurants = Restaurant.all.order('name asc')
  end

  def show
    @food_item = @restaurant.food_items.new
  end

  def update
    if !@manage_restaurant_permission
      flash[:danger] = "Sorry you cannot add a food item to this restaurant"
      redirect_to restaurant_path(@restaurant)
      return
    end
    @food_item = @restaurant.food_items.new(name: params[:food_item][:name], cost: params[:food_item][:cost])
    if @food_item.save
      redirect_to restaurant_path(@restaurant)
    else
      flash[:danger] = @food_item.errors.full_messages.first
      render 'show'
    end
  end

  def destroy 
    if !@manage_restaurant_permission
      flash[:danger] = "Sorry you canont remove a food item from this restaurant"
      redirect_to restaurant_path(@restaurant)
      return
    end
    if @restaurant.destroy
      flash[:success] = "Deleted #{@restaurant.name}"
    else
      flash[:danger] = "Unable to delete specified restaurant"
    end
    redirect_to restaurants_path
  end

  def restaurant_suggestions
    @suggestions = Restaurant.all
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

  def user_has_permission
    if current_user.nil?
      flash[:danger] = "Sorry you do not have permission to modify restaurants."
      redirect_to restaurants_path
      return
    end

    if @restaurant.users.find_by(id: current_user.id).nil? && !current_user.admin?
      flash[:danger] = "Sorry you do not have permission to modify this restaurant."
      redirect_to restaurants_path
      return
    end
  end

  def check_admin
    if current_user.nil? || !current_user.admin?
      flash[:danger] = "Sorry you must be an admin to create restaurants."
      redirect_to restaurants_path
      return 
    end
  end

  def manage_restaurant_permission
    @manage_restaurant_permission = false
    if !current_user.nil? && 
      (!@restaurant.users.find_by(id: current_user.id).nil? || current_user.admin?)
      @manage_restaurant_permission = true
    end
  end
end
