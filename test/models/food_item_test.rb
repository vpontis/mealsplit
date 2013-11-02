require 'test_helper'

class FoodItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def test_subtotal
  	restaurant = FactoryGirl.create(:restaurant)
  	meal = FactoryGirl.create(:meal, restaurant: restaurant)
  	food_item1 = FactoryGirl.build(:food_item, cost: 10.0,)
  	food_item2 = FactoryGirl.build(:food_item,  cost: 11.0,)
  	participant = FactoryGirl.create(:participant, meal: meal, food_items: [food_item1, food_item2])
  	
  	assert_equal 21.0, participant.subtotal
  end

  def test_tax
  	restaurant = FactoryGirl.create(:restaurant)
  	meal = FactoryGirl.create(:meal, restaurant: restaurant)
  	food_item1 = FactoryGirl.build(:food_item, cost: 10.0,)
  	food_item2 = FactoryGirl.build(:food_item,  cost: 11.0,)
  	participant = FactoryGirl.create(:participant, meal: meal, food_items: [food_item1, food_item2])
  	assert_equal 1.365, participant.tax
  end

  def test_tip1
  	restaurant = FactoryGirl.create(:restaurant)
  	meal = FactoryGirl.create(:meal, restaurant: restaurant)
  	food_item1 = FactoryGirl.build(:food_item, cost: 10.0,)
  	food_item2 = FactoryGirl.build(:food_item,  cost: 11.0,)
  	participant = FactoryGirl.create(:participant, meal: meal, food_items: [food_item1, food_item2])
  	assert_equal 3.78, participant.tip
  end

  def test_tip2
  	restaurant = FactoryGirl.create(:restaurant)
  	meal = FactoryGirl.build(:meal, restaurant: restaurant, tip_percent: nil)
  	food_item1 = FactoryGirl.build(:food_item, cost: 10.0,)
  	food_item2 = FactoryGirl.build(:food_item,  cost: 10.0,)
  	participant = FactoryGirl.create(:participant, meal: meal, food_items: [food_item1, food_item2])
  	assert_nil participant.tip
  end

  def test_total
  	restaurant = FactoryGirl.create(:restaurant)
  	meal = FactoryGirl.create(:meal, restaurant: restaurant)
  	food_item1 = FactoryGirl.build(:food_item, cost: 10.0,)
  	food_item2 = FactoryGirl.build(:food_item,  cost: 11.0,)
  	participant = FactoryGirl.create(:participant, meal: meal, food_items: [food_item1, food_item2])
  	assert_equal 22.365, participant.total
  end

  def test_participant_user1
  	restaurant = FactoryGirl.create(:restaurant)
  	meal = FactoryGirl.create(:meal, restaurant: restaurant)
  	food_item1 = FactoryGirl.build(:food_item, cost: 10.0,)
  	food_item2 = FactoryGirl.build(:food_item,  cost: 11.0,)
  	participant = FactoryGirl.create(:participant, meal: meal, food_items: [food_item1, food_item2])
  	puts participant.email
  	assert_equal "Emily", participant.participant_user
  end

  def test_participant_user2

  end

  def test_name
  end
end
