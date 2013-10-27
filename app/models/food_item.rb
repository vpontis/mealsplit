class FoodItem < ActiveRecord::Base
  has_one :restaurant
  has_and_belongs_to_many :participants
end
