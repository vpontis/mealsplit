# primary author: Ty
class UserMailer < ActionMailer::Base
  default from: "mealsplit@gmail.com"

  def payment_request_email(participant, meal)
    @meal = meal
    @meal_payer = @meal.payer.email
    @participant = participant
    mail(to: participant.email, subject: "Payment Request from #{@meal_payer}")
  end

  def payer_summary_email(meal)
    @meal = meal
    @email_address = @meal.payer.email
    mail(to: @email_address, subject: "Meal Summary from #{@meal.restaurant.name}")
  end
end
