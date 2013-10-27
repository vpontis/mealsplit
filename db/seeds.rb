# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:

#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


retaurants = Restaurant.create([
{ name: 'Flour Bakery and Cafe', city: 'Cambridge' },
{ name: 'Chipotle', city: 'Cambridge'},
{ name: 'Veggie Galaxy', city: 'Cambridge'},
{ name: 'Pinkberry', city: 'Cambridge'},
{ name: 'Thelonius Monkfish', city: 'Cambridge' },
	])


Restaurant.find_by(name: 'Veggie Galaxy').food_items.create(name: 'Smoked Reuben', cost: 895)
Restaurant.find_by(name: 'Veggie Galaxy').food_items.create(name: 'BLT', cost: 750)
Restaurant.find_by(name: 'Veggie Galaxy').food_items.create(name: 'Roasted Beet Salad - Small', cost: 575)
Restaurant.find_by(name: 'Veggie Galaxy').food_items.create(name: 'Roasted Beet Salad - Large', cost: 875)
Restaurant.find_by(name: 'Veggie Galaxy').food_items.create(name: 'Eggs Benedict', cost: 825)
Restaurant.find_by(name: 'Veggie Galaxy').food_items.create(name: 'Grilled Cheese', cost: 695)
Restaurant.find_by(name: 'Veggie Galaxy').food_items.create(name: 'The Club', cost: 950)
Restaurant.find_by(name: 'Veggie Galaxy').food_items.create(name: 'Sauteed Chard', cost: 295)
Restaurant.find_by(name: 'Veggie Galaxy').food_items.create(name: 'Sweet Potato Mash', cost: 300)
Restaurant.find_by(name: 'Veggie Galaxy').food_items.create(name: 'Mustard Baked Beans', cost: 300)
Restaurant.find_by(name: 'Veggie Galaxy').food_items.create(name: 'Fries', cost: 300)
Restaurant.find_by(name: 'Thelonius Monkfish').food_items.create(name: 'Shrimp Tempura', cost: 800)
Restaurant.find_by(name: 'Thelonius Monkfish').food_items.create(name: 'C Jam Blues', cost: 700)
Restaurant.find_by(name: 'Thelonius Monkfish').food_items.create(name: 'Vegetable Tempura', cost: 800)
Restaurant.find_by(name: 'Thelonius Monkfish').food_items.create(name: 'Dynamite Roll', cost: 1095)
Restaurant.find_by(name: 'Thelonius Monkfish').food_items.create(name: 'Rainbow Roll', cost: 1095)
Restaurant.find_by(name: 'Thelonius Monkfish').food_items.create(name: 'Spicy Red Dragon Roll', cost: 1395)
Restaurant.find_by(name: 'Thelonius Monkfish').food_items.create(name: 'Lover Man Roll', cost: 1395)
Restaurant.find_by(name: 'Thelonius Monkfish').food_items.create(name: 'Satchmo', cost: 1395)
Restaurant.find_by(name: 'Thelonius Monkfish').food_items.create(name: 'Sophisticated Lady Roll', cost: 1395)
Restaurant.find_by(name: 'Thelonius Monkfish').food_items.create(name: 'Spicy Lobster Roll', cost: 1395)
Restaurant.find_by(name: 'Thelonius Monkfish').food_items.create(name: 'Miso Soup', cost: 300)
Restaurant.find_by(name: 'Thelonius Monkfish').food_items.create(name: 'Mad Monk Maki', cost: 1495)
Restaurant.find_by(name: 'Pinkberry').food_items.create(name: 'Small froyo, no toppings', cost: 400)
Restaurant.find_by(name: 'Pinkberry').food_items.create(name: 'Small froyo, with toppings', cost: 450)
Restaurant.find_by(name: 'Pinkberry').food_items.create(name: 'Small cone, no toppings', cost: 300)
Restaurant.find_by(name: 'Pinkberry').food_items.create(name: 'Medium cone, no toppings', cost: 500)
Restaurant.find_by(name: 'Pinkberry').food_items.create(name: 'Medium cone, with toppings', cost: 550)
Restaurant.find_by(name: 'Pinkberry').food_items.create(name: 'Large cone, no toppings', cost: 600)
Restaurant.find_by(name: 'Pinkberry').food_items.create(name: 'Large cone, with toppings', cost: 650)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Chicken burrito', cost: 678)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Steak burrito', cost: 725)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Barbacoa burrito', cost: 725)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Veggie burrito', cost: 678)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Chicken burrito bowl', cost: 678)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Steak burrito bowl', cost: 725)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Barbacoa burrito bowl', cost: 725)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Veggie burrito bowl', cost: 678)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Chicken taco', cost: 234)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Steak taco', cost: 258)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Barbacoa taco', cost: 258)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Veggie taco', cost: 234)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Chicken salad', cost: 678)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Steak salad', cost: 725)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Barbacoa salad', cost: 725)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Veggie salad', cost: 678)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Chips & Guacamole', cost: 348)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Chips', cost: 141)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Chips & Roasted Chili-Corn Salsa', cost: 211)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Chips & Tomatillo-Green Chili Salsa', cost: 211)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Chips & Tomatillo-Red Chili Salsa', cost: 211)
Restaurant.find_by(name: 'Flour Bakery and Cafe').food_items.create(name: 'Smoked Turkey', cost: 795)
Restaurant.find_by(name: 'Flour Bakery and Cafe').food_items.create(name: 'Fresh Mozzarella and Tomato', cost: 795)
Restaurant.find_by(name: 'Flour Bakery and Cafe').food_items.create(name: 'Hommade Hummus', cost: 795)
Restaurant.find_by(name: 'Flour Bakery and Cafe').food_items.create(name: 'Applewood-Smoked Bacon', cost: 795)
Restaurant.find_by(name: 'Flour Bakery and Cafe').food_items.create(name: 'Curried Tuna', cost: 795)
Restaurant.find_by(name: 'Flour Bakery and Cafe').food_items.create(name: 'Roasted Chicken', cost: 795)
Restaurant.find_by(name: 'Flour Bakery and Cafe').food_items.create(name: 'Roast Beef', cost: 795)
Restaurant.find_by(name: 'Flour Bakery and Cafe').food_items.create(name: 'Roasted Lamb', cost: 795)
Restaurant.find_by(name: 'Flour Bakery and Cafe').food_items.create(name: 'Grilled Roasted Chicken', cost: 795)
Restaurant.find_by(name: 'Flour Bakery and Cafe').food_items.create(name: 'Grilled Portobello Melt', cost: 795)
Restaurant.find_by(name: 'Flour Bakery and Cafe').food_items.create(name: 'Breakfast Egg Sandwich', cost: 695)
Restaurant.find_by(name: 'Flour Bakery and Cafe').food_items.create(name: 'Quinoa and Tofu', cost: 895)
Restaurant.find_by(name: 'Flour Bakery and Cafe').food_items.create(name: 'Chopped Greek Salad', cost: 895)




