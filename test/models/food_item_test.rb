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

  def test_food_item_must_have_name
    food_item = FoodItem.new
    assert_equal food_item.save, false
  end

  def test_food_item_must_have_name_length
    food_item = FoodItem.new
    food_item.name = 'shor'
    assert_equal food_item.save, false
  end
  
   def test_food_item_must_have_name2
    food_item = FoodItem.new
    food_item.name = 'Way Longer'
    assert_equal food_item.save, false
  end

    def test_food_item_must_have_name_and_cost
    food_item = FoodItem.new
    food_item.name = 'Way Longer'
    food_item.cost = 13.54
    assert_equal food_item.save, true
  end
end
