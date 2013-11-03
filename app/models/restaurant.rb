class Restaurant < ActiveRecord::Base
  has_many :food_items
  has_many :meals
  has_and_belongs_to_many :users

  validates :name, presence: true
  validates :city, presence: true
end
