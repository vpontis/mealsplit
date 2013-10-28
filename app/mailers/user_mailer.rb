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
  	mail(to: @email_address, subject: 'Payment Request from '+@meal_leader)
  end
end
