class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :name, length: { minimum: 5, maximum: 100 }

  has_and_belongs_to_many :restaurants

  def participants
    Participant.where("email = ?", self.email)
  end

  def meals
    self.participants.map {|participant| participant.meal }
  end

  # for each meal see how much this user owes
  def owes 
    owes_list = []
    self.meals.each do |meal|
      if meal.payer == self
        next
      end
      participant = meal.participants.find_by(email: self.email)
      owe_object = {}
      owe_object['total'] = participant.total
      owe_object['restaurant'] = meal.restaurant.name
      if meal.payer_id.nil?
        owe_object['payer'] = 'Could not find participant info.'
      else
        owe_object['payer'] = Participant.find_by(id: meal.payer_id).email
      end
      owes_list << owe_object
    end
    owes_list
  end
end
