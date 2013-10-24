require 'faker'

namespace :db do
  namespace :development do
  desc "Fill database with sample data"
  ### TODO: populate this task with creating a couple restaurants and meal items
   task :populate =>  :environment do
    #require 'faker'
  #   admin = User.create!(name: "Admin User", email: "admin@gmail.com",
  #                       password: "passpass", password_confirmation: "passpass", 
  #                       admin:true)
  #   User.create!(name: "Example user", email: "vpontis@gmail.com", 
  #               password: "passpass", password_confirmation: "passpass", 
  #               admin: true)
     99.times do |n|
      
        restuarant =  Restaurant.new(:name => Faker::Name.name, :city => Faker::Address.city)
        restaurant.save!
      end
   end
  end
end
