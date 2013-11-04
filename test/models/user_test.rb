# primary author: Em
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_user_must_have_name
    user = User.new
    assert_equal false, user.save
  end

  def test_user_must_have_name_length
    user = User.new
    user.name = 'shor'
    user.email = 'test@test.com'
    user.password = 'mealsmeals'
    assert_equal false, user.save
  end
  
  def test_user_must_have_name2
    user = User.new
    user.name = 'Way Longer'
    user.email = 'test@test.com'
    user.password = 'mealsmeals'
    assert_equal true, user.save
  end

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
  def test_owes1
    restaurant = FactoryGirl.create(:restaurant)
    meal1 = FactoryGirl.create(:meal, restaurant: restaurant, payer_id: 3)
    food_item1 = FactoryGirl.build(:food_item, cost: 10.0,)
    food_item2 = FactoryGirl.build(:food_item,  cost: 11.0,)
    food_item3 = FactoryGirl.build(:food_item,  cost: 30.0,)
    participant = FactoryGirl.create(:participant, email: "victor@me.com", name: "Victor", meal: meal1, food_items: [food_item1, food_item2], user_id: 4)
    participant = FactoryGirl.create(:participant, email: "emily@me.com", name: "Emily", meal: meal1, food_items: [food_item3], id: 3)
    user = FactoryGirl.build(:user, name: "Victor", email: "victor@me.com", password: "fdsafdsa", id: 4)
    assert_equal [{"total"=>0.0, "restaurant"=>"Flour Bakery and Cafe", "payer"=>"emily@me.com"}], user.owes

  end
  
end
