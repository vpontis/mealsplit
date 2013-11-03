# primary author: Victor
require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  def test_restaurant_must_have_name
    restaurant = Restaurant.new
    restaurant.city = 'Boston'
    assert_equal restaurant.save, false
  end

  def test_restaurant_must_have_city
    restaurant = Restaurant.new
    restaurant.name = 'Chipotles'
    assert_equal restaurant.save, false
  end
end
