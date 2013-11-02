# primary author: Em
require 'test_helper'

class FoodItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_cost_pretty1
    food_item = FactoryGirl.build(:food_item, cost: 10.0,)
    assert_equal '$10.00', food_item.cost_pretty
  end

  def test_cost_pretty2
    food_item = FactoryGirl.build(:food_item, cost: 23.230000,)
    assert_equal '$23.23', food_item.cost_pretty
  end
end
