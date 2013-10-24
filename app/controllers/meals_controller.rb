class MealsController < ApplicationController
  def new
    @meal = Meal.new
  end

  def restaurant_choice
    restaurant_name = params[:restaurant_name]
    redirect_to '/get_participants'
  end

  def get_participants
    
  end

  def participants_list

  end

  def test_email
    send_payment_request("tscizzle@mit.edu", "$5.49", "Abraham of the Sea", "McD's")
  end

  # what action in this controller gets called when a meal is finished and we want to send out emails?
  # for now, this is the helper to send payment request emails
  private
    def send_payment_request(email, amount, leader, restaurant)
      UserMailer.payment_request_email(email, amount, leader, restaurant).deliver
    end
end
