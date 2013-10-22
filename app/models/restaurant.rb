class Restaurant < ActiveRecord::Base
  has_many :food_items
end
