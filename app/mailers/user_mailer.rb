# primary author: Ty
class UserMailer < ActionMailer::Base
  default from: "MealSplit"

  def payment_request_email(participant, meal)
    @meal = meal
  	@meal_leader = @meal.payer.email
    @participant = participant
  	mail(to: participant.email, subject: "Payment Request from #{@meal_leader}")
  end

  def leader_summary_email(meal)
    @meal = meal
    @email_address = @meal.payer.email
    mail(to: @email_address, subject: "Meal Summary from #{@meal.restaurant.name}")
  end
end
