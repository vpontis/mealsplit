# primary author: Em
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_participants
    participant = FactoryGirl.create(:participant, email: "victor@me.com", name: "Victor")
    user = FactoryGirl.build(:user, name: "Victor", email: "victor@me.com", password: "fdsafdsa")
    assert_equal Participant.first,  user.participants[0]
  end

  def test_participants
    participant = FactoryGirl.create(:participant, email: "emily@me.com", name: "Victor")
    user = FactoryGirl.build(:user, name: "Victor", email: "victor@me.com", password: "fdsafdsa")
    assert_equal nil,  user.participants[0]
  end

  def test_meals
    restaurant = FactoryGirl.create(:restaurant)
    meal1 = FactoryGirl.create(:meal, restaurant: restaurant)
    participant = FactoryGirl.create(:participant, email: "victor@me.com", name: "Victor", meal: meal1)
    user = FactoryGirl.build(:user, name: "Victor", email: "victor@me.com", password: "fdsafdsa")
    assert_equal meal1, user.meals[0]
  end

  def test_does_owe_for_meal1
    restaurant = FactoryGirl.create(:restaurant)
    meal = FactoryGirl.create(:meal, restaurant: restaurant)
    participant = FactoryGirl.create(:participant)
    user = FactoryGirl.create(:user, email: "test3@test.com", password: "fdsafdsa")
    assert_equal true, user.does_owe_for_meal(meal)
  end
  '''
  def test_does_owe_for_meal2
    restaurant = FactoryGirl.create(:restaurant)
    meal = FactoryGirl.create(:meal,  restaurant: restaurant)
    participant = FactoryGirl.create(:participant)
    user = FactoryGirl.create(:user, email: "test4@test.com", password: "fdsafdsa", id: 2)
    assert_equal nil, user.does_owe_for_meal(meal)
  end
  '''

  def test_user_to_owe_for_meal
    restaurant = FactoryGirl.create(:restaurant)
    meal = FactoryGirl.create(:meal, restaurant: restaurant)
    participant = FactoryGirl.create(:participant, meal: meal)
    user = FactoryGirl.create(:user, email: "test9999@test.com", password: "1234hoisihif")
    assert_equal User.find_by(email: "test1@test.com"), user.user_to_owe_for_meal(meal)
  end

  def test_user_participant_for_meal
    restaurant = FactoryGirl.create(:restaurant)
    meal = FactoryGirl.create(:meal, restaurant: restaurant, id: 6)
    participant = FactoryGirl.create(:participant, meal: meal, email: "meow@meow.com", meal_id: 6, user_id: 5)
    user = FactoryGirl.create(:user, email: "meow@meow.com", password: "yosoyungato", id: 5)
    assert_equal Participant.find_by(user_id: 5), user.user_participant_for_meal(meal)

  end

  def test_owes_how_much_for_meal
    restaurant = FactoryGirl.create(:restaurant)
    meal = FactoryGirl.create(:meal, restaurant: restaurant, id: 6)
    food_item1 = FactoryGirl.build(:food_item, cost: 10.0,)
    food_item2 = FactoryGirl.build(:food_item,  cost: 11.0,)
    participant = FactoryGirl.create(:participant, meal: meal, email: "meow@meow.com", meal_id: 6, user_id: 5, food_items: [food_item1, food_item2])
    user = FactoryGirl.create(:user, email: "meow@meow.com", password: "yosoyungato", id: 5)
    assert_equal 26.145, user.owes_how_much_for_meal(meal)

  end 
end
