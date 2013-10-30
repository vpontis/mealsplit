require 'test_helper'

class MealTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test test_payer do
  	meal = FactoryGirl.create(:meal)
  	meal.payer_id = nil
    assert_nil 
  end
end
