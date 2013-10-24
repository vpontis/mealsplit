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

  	def load_suggestions
    	@suggestions = Restaurant.select(:name) or Restaurant.find(:name)
    	render json: @suggestions
  	end
end
