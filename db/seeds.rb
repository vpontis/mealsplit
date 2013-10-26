# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:

#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


retaurants = Restaurant.create([
{ name: 'Chicago Pizza', city: 'Cambridge' },
{ name: 'Flour Bakery and Cafe', city: 'Cambridge' },
{ name: 'Area Four', city: 'Cambridge'},
{ name: 'Island Creek Oyster Bar'},
{ name: 'Chipotle', city: 'Cambridge'},
{ name: 'Cafe 472', city: 'Boston'},
{ name: 'Veggie Planet', city: 'Cambridge'},
{ name: 'Veggie Galaxy', city: 'Cambridge'},
{ name: 'Pinkberry', city: 'Cambridge'},
{ name: 'The Friendly Toast', city: 'Cambridge'},
{ name: 'Beijing Tokyo', city: 'Cambridge'},
{ name: 'Mulan', city: 'Cambridge'},
{ name: 'Desi Dhaba', city: 'Cambridge'},
{ name: 'Za', city: 'Cambridge' },
{ name: 'Legal Seafoods', city: 'Boston'},
{ name: 'The Capital Grille', city: 'Boston'},
{ name: 'Chili Duck', city: 'Boston'},
{ name: 'Boston Burger Company', city: 'Boston'},
{ name: 'Boloco', city: 'Boston'},
{ name: 'Berryline', city: 'Boston'},
{ name: 'Thelonius Monkfish', city: 'Cambridge' },
{ name: 'Kayuga', city: 'Brighton'},
	])


Restaurant.find_by(name: 'Veggie Galaxy').food_items.create(name: 'Reuben', cost: 895)
Restaurant.find_by(name: 'Veggie Galaxy').food_items.create(name: 'BLT', cost: 750)
Restaurant.find_by(name: 'Veggie Galaxy').food_items.create(name: 'Roasted Beet Salad - Small', cost: 575)
Restaurant.find_by(name: 'Veggie Galaxy').food_items.create(name: 'Roasted Beet Salad - Large', cost: 875)
Restaurant.find_by(name: 'Thelonius Monkfish').food_items.create(name: 'Shrimp Tempura', cost: 800)
Restaurant.find_by(name: 'Thelonius Monkfish').food_items.create(name: 'Miso Soup', cost: 300)
Restaurant.find_by(name: 'Thelonius Monkfish').food_items.create(name: 'Mad Monk Maki', cost: 1495)
Restaurant.find_by(name: 'Pinkberry').food_items.create(name: 'Small froyo, no toppings', cost: 400)
Restaurant.find_by(name: 'Pinkberry').food_items.create(name: 'Small froyo, with toppings', cost: 450)
Restaurant.find_by(name: 'Pinkberry').food_items.create(name: 'Small cone, no toppings', cost: 300)
