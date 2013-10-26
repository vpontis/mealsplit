require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate =>  :environment do
    99.times do |n|
      Restaurant.new(:name => Faker::Name.name, :city => Faker::Address.city).save!
    end
  end
end
