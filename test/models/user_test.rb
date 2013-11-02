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

  def test_does_owe_for_meal
    restaurant = FactoryGirl.create(:restaurant)
    meal = FactoryGirl.create(:meal, restaurant: restaurant)
    puts meal.payer_id,"cccc"
    participant = FactoryGirl.create(:participant)
    user = FactoryGirl.create(:user, email: "test2@test.com", password: "fdsafdsa", id: 1)
    puts "aaaa",meal.payer,"bbb"
    
    assert_false user.does_owe_for_meal(meal)
  end

  def test_user_to_owe_for_meal
  end

  def test_user_participant_for_meal
  end

  def test_owes_how_much_for_meal
  end 
end
