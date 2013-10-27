class Restaurant < ActiveRecord::Base
  has_many :food_items
  has_many :meals
end
