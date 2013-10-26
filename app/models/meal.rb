class Meal < ActiveRecord::Base
  has_one :restaurant
  has_many :participants
end
