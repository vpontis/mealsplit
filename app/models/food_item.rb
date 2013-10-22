class FoodItem < ActiveRecord::Base
  has_one :restaurant
end
