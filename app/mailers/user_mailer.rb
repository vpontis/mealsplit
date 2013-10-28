class UserMailer < ActionMailer::Base
  default from: "MealSplit"

  def payment_request_email(participant, meal)
    @meal = meal
  	@meal_leader = @meal.payer.email
    @participant = participant
  	mail(to: participant.email, subject: 'Payment Request from '+@meal_leader)
  end

  def leader_summary_email(meal)
    @email_address = Participant.find(meal.payer_id).email
    @restaurant_name = Restaurant.find(meal.restaurant_id)
    @meal = meal
    @participants = meal.participants
    mail(to: @email_address, subject: 'Meal Summary from '+@restaurant_name.to_s)
  end
end
