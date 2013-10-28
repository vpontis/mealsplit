class UserMailer < ActionMailer::Base
  default from: "MealSplit"

  def payment_request_email(participant, meal)
  	@email_address = participant.email
  	@items_total = participant.subtotal
    @tax = participant.tax
    @total = participant.total
  	@meal_leader = Participant.find(meal.payer_id).email
  	@restaurant_name = Restaurant.find(meal.restaurant_id).name
  	@items = participant.food_items
  	@tip_percent = meal.tip_percent
  	mail(to: @email_address, subject: 'Payment Request from '+@meal_leader.to_s)
  end

  def leader_summary_email(meal)
    @email_address = Participant.find(meal.payer_id).email
    @restaurant_name = Restaurant.find(meal.restaurant_id)
    @meal = meal
    @participants = meal.participants
    mail(to: @email_address, subject: 'Meal Summary from '+@restaurant_name.to_s)
  end
end
