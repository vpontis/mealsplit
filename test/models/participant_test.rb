# primary author: Em
require 'test_helper'

class ParticipantTest < ActiveSupport::TestCase

  def test_email
    participant = Participant.new
    assert_equal false, participant.save
  end

  def test_email_format
    participant = Participant.new
    participant.email = "notarealemail.com"
    assert_equal false, participant.save
  end

  def test_email_format1
    participant = Participant.new
    participant.email = "real@email.com"
    assert_equal true, participant.save
  end

  def test_email_format1
    participant = Participant.new
    participant.email = "real.real@email.com"
    assert_equal true, participant.save
  end

  def test_email_format1
    participant = Participant.new
    participant.email = "real@email.edu"
    assert_equal true, participant.save
  end

  def test_email_format1
    participant = Participant.new
    participant.email = "real@email.ac.lk"
    assert_equal true, participant.save
  end

  def test_subtotal
  	restaurant = FactoryGirl.create(:restaurant)
  	meal = FactoryGirl.create(:meal, restaurant: restaurant)
  	food_item1 = FactoryGirl.build(:food_item, cost: 10.0,)
  	food_item2 = FactoryGirl.build(:food_item,  cost: 11.0,)
  	participant = FactoryGirl.create(:participant, meal: meal, food_items: [food_item1, food_item2], email: "email@email.com")
  	
  	assert_equal 21.0, participant.subtotal
  end

  def test_tax
  	restaurant = FactoryGirl.create(:restaurant)
  	meal = FactoryGirl.create(:meal, restaurant: restaurant)
  	food_item1 = FactoryGirl.build(:food_item, cost: 10.0,)
  	food_item2 = FactoryGirl.build(:food_item,  cost: 11.0,)
  	participant = FactoryGirl.create(:participant, meal: meal, food_items: [food_item1, food_item2], email: "email@email.com")
  	assert_equal 1.365, participant.tax
  end

  def test_tip1
  	restaurant = FactoryGirl.create(:restaurant)
  	meal = FactoryGirl.create(:meal, restaurant: restaurant)
  	food_item1 = FactoryGirl.build(:food_item, cost: 10.0,)
  	food_item2 = FactoryGirl.build(:food_item,  cost: 11.0,)
  	participant = FactoryGirl.create(:participant, meal: meal, food_items: [food_item1, food_item2], email: "email@email.com")
  	assert_equal 3.78, participant.tip
  end

  def test_tip2
  	restaurant = FactoryGirl.create(:restaurant)
  	meal = FactoryGirl.build(:meal, restaurant: restaurant, tip_percent: nil)
  	food_item1 = FactoryGirl.build(:food_item, cost: 10.0,)
  	food_item2 = FactoryGirl.build(:food_item,  cost: 10.0,)
  	participant = FactoryGirl.create(:participant, meal: meal, food_items: [food_item1, food_item2], email: "email@email.com")
  	assert_nil participant.tip
  end

  def test_total
  	restaurant = FactoryGirl.create(:restaurant)
  	meal = FactoryGirl.create(:meal, restaurant: restaurant)
  	food_item1 = FactoryGirl.build(:food_item, cost: 10.0,)
  	food_item2 = FactoryGirl.build(:food_item,  cost: 11.0,)
  	participant = FactoryGirl.create(:participant, meal: meal, food_items: [food_item1, food_item2], email: "email@email.com")
  	assert_equal 22.365, participant.total
  end

  def test_participant_user1
  	restaurant = FactoryGirl.create(:restaurant)
  	meal = FactoryGirl.create(:meal, restaurant: restaurant)
  	participant = FactoryGirl.create(:participant, meal: meal, food_items: [], email: "test1@test.com", name: "Emily")
  	assert_equal User.find_by(email: "test1@test.com"), participant.participant_user
  end

  def test_name1
  	restaurant = FactoryGirl.create(:restaurant)
  	meal = FactoryGirl.create(:meal, restaurant: restaurant)
  	participant = FactoryGirl.create(:participant, meal: meal, food_items: [], email: "emily@emily.com")

  	assert_equal nil, participant.name
  end

  def test_name2
  	restaurant = FactoryGirl.create(:restaurant)
  	meal = FactoryGirl.create(:meal, restaurant: restaurant)
  	participant = FactoryGirl.create(:participant, meal: meal, food_items: [], email: "test1@test.com", name: "Emily")
  	assert_equal participant.participant_user.name, participant.name
  end
end
