require 'test_helper'

class MealTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #meal = FactoryGirl.create(:meal, restaurant: restaurant)


  def test_next_participant_path_no_unprocessed
  	restaurant = FactoryGirl.create(:restaurant)
  	participant = FactoryGirl.create(:participant)
  	meal = FactoryGirl.create(:meal, restaurant: restaurant)
  	assert_equal "/meals/1/participants/1/edit", meal.next_participant_path
  end

  def test_next_participant_path_unprocessed
  	restaurant = FactoryGirl.create(:restaurant)
  	participant = FactoryGirl.create(:participant, processed: false)
  	meal = FactoryGirl.create(:meal, restaurant: restaurant)
  	assert_equal "/meals/1/participants/1/edit", meal.next_participant_path
  end
  '''
  def test_unprocessed_participants
  	restaurant = FactoryGirl.create(:restaurant)
  	#participant1 = FactoryGirl.build(:participant, processed: false)
  	#participant2 = FactoryGirl.build(:participant, processed: false)
  	food_items = FactoryGirl.create(:food_item)
  	meal = FactoryGirl.create(:meal, restaurant: restaurant)
  	participant1 = FactoryGirl.build(:participant_with_food_items, meal: meal, food_items: nil)
  	participant2 = FactoryGirl.build(:participant_with_food_items, meal: meal, food_items: nil)
  	assert_equal nil, meal.unprocessed_participants
  end
  '''
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
