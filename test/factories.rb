# primary author: Em
FactoryGirl.define do
    factory :participant do
        id 1
        name "Emily"
        email "test1@test.com"
        payer true
        meal_id 1
        processed true

        factory :participant_with_food_items do
        	ignore do
        		food_items 0
        	end

        	after(:create) do |participant, evaluator|
        		FactoryGirl.create_list(:food_item, :evaluator.food_itmes, participants: [participant])
       		end 
        end

     end

    factory :restaurant do
        id 1
        name "Flour Bakery and Cafe"
       	city "Cambridge"
       	tax 0.065
    end

    factory :meal do
        id 1
       	restaurant_id 1
       	payer_id 1
       	tip_percent 0.18
    end

    factory :food_item do
    	name "Tofu"
    	cost 10.0
    	restaurant_id 1
   	end

   	factory :user do
   		id 1
   		name "Emily"
   		email "test2@test.com"
   	end
end