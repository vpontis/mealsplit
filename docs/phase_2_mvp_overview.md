MealSplit Phase 2 - MVP
=======================
Authors
-------
+ Victor Pontis
+ Tyler Singer-Clark
+ Emily Zhang

Instructions for Testing the MVP
--------------------------------

1. Go to: http://mealsplit.herokuapp.com/ and click Split a Meal
2. Choose a restaurant that is in our database (we currently have Flour, Chipotle, Pinkberry, and more)
3. Enter a valid email address for the person who paid for the meal
4. Enter one or more emails of other meal-participants, whom the payee paid for. You can remove and re-add them as necessary
5. Once finished with adding meal-participants, you can begin entering food-items for each participant. 
6. For each person, add one or more food-items from the preloaded menu. You can remove and re-add them as necessary. You can also switch between each meal-participant freely
7. Once everyone has at least one food-item, you can see the summary for your meal by clicking on the Meal Summary and Confirmation page.
8. On the summary and confirmation page, you can review each person’s order and go back and change them as necessary. 
9. Tax is pre-calculated based on location (currently, all our restaurants are in Massachusetts, so we chose to hard-code it in for now, but this will later be based on the city field of each restaurant). You can choose to tip 0, 10, 15, or 20 percent. 
10. Click Send Payment Request and a summary email will be sent to the payer with the meal details. All other participants will receive an email detailing what they ate, how much it cost, how much they owe (based on what they ate, tax, and tip), and to whom they owe it. 
11. Check your inbox!


Addressing Comments from Part 1
-------------------------------
- Paying in cash is more than manually figuring out what each person has to pay. It raises two issues that we address in our app: 1) the fact that people are limited in what they can pay based on the combinations of physical dollars they have and 2)each person is responsible for their own calculation and tip percentage. MealSplit makes it such that people aren’t limited by what’s in their pocket and the grunt work and calculations are done behind the scenes, with input from just a single participant. While we don’t have a payment/charge system built in, these differences in the payment process are what we targeted when saying that paying cash is an alternative.

- In a future version of the app, there may be an administrative system where restaurant owners could go into the app and edit their restaurant’s menus. This wasn’t explictly stated in the Phase 1 design document, but the arrow in the context diagram implies an administrative system for restaurant proprietors. We don’t implement this feature in the MVP either. 

- See updated data model

MVP
---
- In our original document, we say:
“Our MVP will be an app for all meal-participants to use. The meal-payer will load our app, enter a restaurant name, and food items for each person. MealSplit will then email the meal-payer a summary of the meal and the meal-participants their individual charges, with tax and tip precalculated.”

- The MVP that we are delivering allows for all of this:
    - entering a restaurant name from a preloaded source 
    - adding meal-participants (their emails) to a meal
    - entering food items for each meal-participant from a preloaded source
    - emailing out a receipt to each meal-participant with 
    - tax and tip precalculated
 
Design Challenges
-----------------
+ Should payment request be an object?
	We chose not to have a payment request be an object, because its information is held within other objects (meals, participants, food_items) and it is not necessary to persist it in the database (at least at this stage). We would instantiate and then stop using it in quick succession, so it seemed unhelpful to include it as a model, as we could instead just extract the information from the other models at the time of need.

+ What content should go into the notification emails for the leader?
  + Possible solutions
    + A summary of the entire meal
      + Pros
        + All the necessary information is persisted
        + Email client can be used to store meal history
      + Cons
        + Potentially a large email for many-person meals
    + Just the totals for each participant
      + Pros
        + Short and to the point, doesn’t bother will details
      + Cons
        + Possibly missing wanted information
        + Cannot check later why people have what totals without going to each person’s notification individually
  + Solution
    + A summary of the entire meal
      + This is safest, from an information standpoint. The payer can go back to this email and see who owes what, and why. This keeps everyone more accountable, and makes adjustments easier if afterward someone wants to make a case for what they think they owe.


+ How do you notify users of a charge request?
  + Possible solutions
    + Notification in the app
      + Pros 
        + Users can manage everything from the app
      + Cons
        + Much more complicated
    + Email with information
      + Pros
        + People already use email clients
        + Simple
      + Cons
        + Does not bring people into the app
        + Cannot be managed from the app
  + Solution: email with information. For our MVP we wanted to go with the simplest route and emailing a notification did this. Most people also have email clients they use frequently so this is a good way to get somebody’s attention.

+ How should tip be divided?
  + Possible solutions
    + Tip is evenly split among participants
      + Pros
        + Simple way of doing things
        + Each person theoretically had similar service
      + Cons
        + This is not how tip is usually calculated among friends
    + Tip is proportional to cost of items
      + Pros
        + This is how tip is usually calculated
      + Cons
        + Default behavior may not be good for everyone
    + User can choose from the above two options
      + Pros
        + Allows for greater user customization and control
      + Cons
        + More complicated for both implementation and user
        + Not an important customization
  + Solution: tip is proportional to a user’s item total
    + Rational: We chose to have each person’s tip be proportional to their item total. This seems like the fairest method, and a common practice in meal sharing already. An alternative would be calculating a total tip for the group and dividing that evenly between the participants.
	To stick with the extreme-ease theme of our app, we have the group agree on a tip_percentage for the group instead of a certain one for each participant. Otherwise, that is an extra step in the process for every single person, which is not worth the slight freedom of choosing individual tip_percentages.
	This is reflected in the fact that a Meal has a tip_percent field, not a participant.