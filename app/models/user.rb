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
end
