require 'test_helper'

class MealTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #meal = FactoryGirl.create(:meal, restaurant: restaurant)
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

  def test_next_participant_path_no_unprocessed
  	restaurant = FactoryGirl.create(:restaurant)
  	participant = FactoryGirl.create(:participant)
  	meal = FactoryGirl.create(:meal, restaurant: restaurant)
  	assert_equal "/meals/1/participants/1/edit", meal.next_participant_path
  end

  def test_next_participant_path_unprocessed
  	restaurant = FactoryGirl.create(:restaurant)
  	participant = FactoryGirl.create(:participant)
  	meal = FactoryGirl.create(:meal, restaurant: restaurant)
  	assert_equal "/meals/1/participants/1/edit", meal.next_participant_path
  end
end
