class RestaurantsController < ApplicationController
	def new
    	@restaurant = Restaurant.new
  	end

  	def index
    	@autocomplete_items = Restaurant.all
  	end

  	def load_suggestions
    	@suggestions = Restaurant.select(:name) or Restaurant.find(:all)
    	render json: @suggestions
  	end
end
