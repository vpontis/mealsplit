class Restaurant < ActiveRecord::Base
  has_many :food_items
  has_many :meals

  validate :name, presence: true
  validate :city, presence: true
end
