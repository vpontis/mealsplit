class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # has_many :participants
  # has_many :meals, through: :participants
  validates :name, length: { minimum: 5, maximum: 100 }


  def participants
    Participant.where("email = ?", self.email)
  end

  def meals
    self.participants.map {|participant| participant.meal }
  end

  def does_owe_for_meal(meal)
    self.id != meal.payer.participant_user.id
  end

  def user_to_owe_for_meal(meal)
    meal.payer.participant_user
  end

  def user_participant_for_meal(meal)
    Participant.where("meal_id = ? AND email = ?", meal.id, self.email).first
  end

  def owes_how_much_for_meal(meal)
    participant = user_participant_for_meal(meal)
    participant.total+participant.tip
  end    
end
