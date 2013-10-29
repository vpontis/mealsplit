# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:

#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


retaurants = Restaurant.create([
{ name: 'Flour Bakery and Cafe', city: 'Cambridge' },
{ name: 'Chipotle', city: 'Boston'},
{ name: 'Veggie Galaxy', city: 'Cambridge'},
{ name: 'Pinkberry', city: 'Boston'},
{ name: 'Thelonius Monkfish', city: 'Cambridge' },
	])


Restaurant.find_by(name: 'Veggie Galaxy').food_items.create(name: 'Smoked Reuben', cost: 8.95)
Restaurant.find_by(name: 'Veggie Galaxy').food_items.create(name: 'BLT', cost: 7.50)
Restaurant.find_by(name: 'Veggie Galaxy').food_items.create(name: 'Roasted Beet Salad - Small', cost: 5.75)
Restaurant.find_by(name: 'Veggie Galaxy').food_items.create(name: 'Roasted Beet Salad - Large', cost: 8.75)
Restaurant.find_by(name: 'Veggie Galaxy').food_items.create(name: 'Eggs Benedict', cost: 8.25)
Restaurant.find_by(name: 'Veggie Galaxy').food_items.create(name: 'Grilled Cheese', cost: 6.95)
Restaurant.find_by(name: 'Veggie Galaxy').food_items.create(name: 'The Club', cost: 9.50)
Restaurant.find_by(name: 'Veggie Galaxy').food_items.create(name: 'Sauteed Chard', cost: 295)
Restaurant.find_by(name: 'Veggie Galaxy').food_items.create(name: 'Sweet Potato Mash', cost: 3.00)
Restaurant.find_by(name: 'Veggie Galaxy').food_items.create(name: 'Mustard Baked Beans', cost: 3.00)
Restaurant.find_by(name: 'Veggie Galaxy').food_items.create(name: 'Fries', cost: 3.00)
Restaurant.find_by(name: 'Thelonius Monkfish').food_items.create(name: 'Shrimp Tempura', cost: 8.00)
Restaurant.find_by(name: 'Thelonius Monkfish').food_items.create(name: 'C Jam Blues', cost: 7.00)
Restaurant.find_by(name: 'Thelonius Monkfish').food_items.create(name: 'Vegetable Tempura', cost: 8.00)
Restaurant.find_by(name: 'Thelonius Monkfish').food_items.create(name: 'Dynamite Roll', cost: 10.95)
Restaurant.find_by(name: 'Thelonius Monkfish').food_items.create(name: 'Rainbow Roll', cost: 10.95)
Restaurant.find_by(name: 'Thelonius Monkfish').food_items.create(name: 'Spicy Red Dragon Roll', cost: 13.95)
Restaurant.find_by(name: 'Thelonius Monkfish').food_items.create(name: 'Lover Man Roll', cost: 13.95)
Restaurant.find_by(name: 'Thelonius Monkfish').food_items.create(name: 'Satchmo', cost: 13.95)
Restaurant.find_by(name: 'Thelonius Monkfish').food_items.create(name: 'Sophisticated Lady Roll', cost: 13.95)
Restaurant.find_by(name: 'Thelonius Monkfish').food_items.create(name: 'Spicy Lobster Roll', cost: 13.95)
Restaurant.find_by(name: 'Thelonius Monkfish').food_items.create(name: 'Miso Soup', cost: 3.00)
Restaurant.find_by(name: 'Thelonius Monkfish').food_items.create(name: 'Mad Monk Maki', cost: 14.95)
Restaurant.find_by(name: 'Pinkberry').food_items.create(name: 'Small froyo, no toppings', cost: 4.00)
Restaurant.find_by(name: 'Pinkberry').food_items.create(name: 'Small froyo, with toppings', cost: 4.50)
Restaurant.find_by(name: 'Pinkberry').food_items.create(name: 'Small cone, no toppings', cost: 3.00)
Restaurant.find_by(name: 'Pinkberry').food_items.create(name: 'Medium cone, no toppings', cost: 5.00)
Restaurant.find_by(name: 'Pinkberry').food_items.create(name: 'Medium cone, with toppings', cost: 5.50)
Restaurant.find_by(name: 'Pinkberry').food_items.create(name: 'Large cone, no toppings', cost: 6.00)
Restaurant.find_by(name: 'Pinkberry').food_items.create(name: 'Large cone, with toppings', cost: 6.50)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Chicken burrito', cost: 6.78)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Steak burrito', cost: 7.25)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Barbacoa burrito', cost: 7.25)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Veggie burrito', cost: 6.78)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Chicken burrito bowl', cost: 6.78)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Steak burrito bowl', cost: 7.25)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Barbacoa burrito bowl', cost: 7.25)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Veggie burrito bowl', cost: 6.78)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Chicken taco', cost: 2.34)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Steak taco', cost: 2.58)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Barbacoa taco', cost: 2.58)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Veggie taco', cost: 2.34)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Chicken salad', cost: 6.78)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Steak salad', cost: 7.25)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Barbacoa salad', cost: 7.25)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Veggie salad', cost: 6.78)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Chips & Guacamole', cost: 3.48)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Chips', cost: 1.41)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Chips & Roasted Chili-Corn Salsa', cost: 2.11)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Chips & Tomatillo-Green Chili Salsa', cost: 2.11)
Restaurant.find_by(name: 'Chipotle').food_items.create(name: 'Chips & Tomatillo-Red Chili Salsa', cost: 2.11)
Restaurant.find_by(name: 'Flour Bakery and Cafe').food_items.create(name: 'Smoked Turkey', cost: 7.95)
Restaurant.find_by(name: 'Flour Bakery and Cafe').food_items.create(name: 'Fresh Mozzarella and Tomato', cost: 7.95)
Restaurant.find_by(name: 'Flour Bakery and Cafe').food_items.create(name: 'Hommade Hummus', cost: 7.95)
Restaurant.find_by(name: 'Flour Bakery and Cafe').food_items.create(name: 'Applewood-Smoked Bacon', cost: 7.95)
Restaurant.find_by(name: 'Flour Bakery and Cafe').food_items.create(name: 'Curried Tuna', cost: 7.95)
Restaurant.find_by(name: 'Flour Bakery and Cafe').food_items.create(name: 'Roasted Chicken', cost: 7.95)
Restaurant.find_by(name: 'Flour Bakery and Cafe').food_items.create(name: 'Roast Beef', cost: 7.95)
Restaurant.find_by(name: 'Flour Bakery and Cafe').food_items.create(name: 'Roasted Lamb', cost: 7.95)
Restaurant.find_by(name: 'Flour Bakery and Cafe').food_items.create(name: 'Grilled Roasted Chicken', cost: 7.95)
Restaurant.find_by(name: 'Flour Bakery and Cafe').food_items.create(name: 'Grilled Portobello Melt', cost: 7.95)
Restaurant.find_by(name: 'Flour Bakery and Cafe').food_items.create(name: 'Breakfast Egg Sandwich', cost: 6.95)
Restaurant.find_by(name: 'Flour Bakery and Cafe').food_items.create(name: 'Quinoa and Tofu', cost: 8.95)
Restaurant.find_by(name: 'Flour Bakery and Cafe').food_items.create(name: 'Chopped Greek Salad', cost: 8.95)




