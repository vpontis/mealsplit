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
    @suggestions = Restaurant.select(:name) or Restaurant.find(:all)
    logger.debug @suggestions
    # @suggestions = @suggestions.map! do |suggestion|
    #   {
    #     value: suggestion.name.gsub("'", ""),
    #     tokens: suggestion.name.gsub("'", "").split
    #   }
    # end
    @suggestions.map! { |s| s.name.gsub("'", "") }
    logger.debug @suggestions
    render json: @suggestions
  end
end
