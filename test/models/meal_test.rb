# primary author: Em
require 'test_helper'

class MealTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  def test_next_participant
  	restaurant = FactoryGirl.create(:restaurant)
  	participant = FactoryGirl.create(:participant)
  	meal = FactoryGirl.build_stubbed(:meal, restaurant: restaurant)
  	assert_equal meal.unprocessed_participants.first, meal.next_participant
  end

  def test_unprocessed_participants
  	restaurant = FactoryGirl.create(:restaurant)
  	food_items = FactoryGirl.create(:food_item)
  	meal = FactoryGirl.create(:meal, restaurant: restaurant)
  	participant1 = FactoryGirl.build(:participant_with_food_items, meal: meal, food_items: [])
  	participant2 = FactoryGirl.build(:participant_with_food_items, meal: meal, food_items: [])
  	assert_equal [], meal.unprocessed_participants
  end

  def test_payer 
   	restaurant = FactoryGirl.create(:restaurant)
  	meal = FactoryGirl.create(:meal, restaurant: restaurant)
    assert_equal 1, meal.payer_id
  end

  def test_payer2 
   	restaurant = FactoryGirl.create(:restaurant)
  	meal = FactoryGirl.create(:meal, restaurant: restaurant, payer_id: nil)
    assert_equal nil, meal.payer_id
  end

  def test_tax
  	restaurant = FactoryGirl.create(:restaurant)
  	assert_equal 0.065, restaurant.tax
  end

end
