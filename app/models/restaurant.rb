class Restaurant < ActiveRecord::Base
  has_many :food_items
  has_many :meals
  has_and_belongs_to_many :users

  validate :name, presence: true
  validate :city, presence: true
end
