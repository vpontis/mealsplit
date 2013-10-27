class UserMailer < ActionMailer::Base
  default from: "MealSplit"

  def payment_request_email(emailAddress, paymentAmount, mealLeader, restaurant) # perhaps more info? (menu items, etc.)
  	@email_address = emailAddress
  	@payment_amount = paymentAmount
  	@meal_leader = mealLeader
  	@restaurant = restaurant
  	mail(to: @email_address, subject: 'Payment Request from '+@meal_leader.to_s)
  end
end
