Phase 1 Design Doc
==================
Authors
-------
+ Victor Pontis
+ Tyler Singer-Clark
+ Emily Zhang

Purpose and Goals
=================
Purpose
-------

Problem: A group of friends go to a restaurant and get a single bill. Each wants to pay for their meal, calculation can be difficult. People know what they ordered but they don’t know how much it cost and don’t want to factor in multiple items and tax. 

Solution: MealSplit will allow a user to choose a restaurant and a group of people. The user will then be able to assign different menu items to each person in the group. The app will then calculate the amount that each person owes and send an invoice to that person’s profile/email. 


Motivation for Development 
--------------------------

###Current Solutions

+ People paying cash, trying to split
+ Asking for split checks
+ One person paying for everyone
+ Technological
  + Venmo
  + GroupMe
  + Plates App (by Splitwise)

###Problem with Current Solutions

The current solutions still require each person to calculate how much they spent based on their menu items. This requires every person to look at the receipt or remember the cost from the menu. 

###Description of system to be build
MealSplit will make keeping track of IOUs after a shared meal easier.

####MVP
Our MVP will be an app for all meal-participants to use. The meal-payer will load our app, enter a restaurant name, and meal-price for each person. MealSplit will then email the meal-payer a summary of the meal and the meal-participants their individual charges, with tax and tip precalculated. 

####Full-Feature App
MealSplit’s full-feature app has many different possibilities of improvement upon the MVP. It will definitely include:

+ sessions for each user: users should be able to log in and out of the app and see their past transactions, completed and incomplete. 
+ a better way to pull data from a menu, either through the Locu API or by letting restaurants log in as a superuser to change the menu items 

Other ideas we might implement: 

+ connecting with the Square Cash or Venmo API to complete charges
+ pinging people for uncompleted charges
+ uploading pictures of receipts to attach to charges
+ OCR receipts to identify menu items

Context Diagram
---------------

![Phase 1 Context Diagram](phase_1_context_diagram.png)

Our context diagram has our MealSplit app in the middle. Meal-payers comes to MealSplit and enter in the information about the meal: who was involved and what items were ordered. MealSplit pulls menu and food item information from Locu about restaurant menus and items and also allows for restaurants to enter in their menu information. This data allows for autocompletion of the user’s inputs and automatically calculates prices and taxes. After a meal is completed, MealSplit will then email the meal-payer a summary of the meal and who owes them money as well as emailing an invoice to everyone involved with the meal. 

Key Concepts
------------

One of the benefits of MealSplit is that it does not really introduce any foreign concepts. The users of MealSplit should intuitively understand the different components and concepts in MealSplit. Below we outline our four main concepts. 

+ Menu
  + Each restaurant has a list of `food items` which it serves.
+ Meal
  + A `meal` consists of a group of people eating at a restaurant together. They all pay on one tab and one person orders. Everyone at the meal orders there own food and may have one or more `food items`.
+ Food item
  + At a restaurant a person orders one or more several `food items`. A food item has a name and a price. `Food items` can also be split between people.
+ Owing money for meal
  + At each `meal` one person pays for everyone else so the other participants of the meal all owe the payer for their portion of the `meal`.

Data Model
----------
![Phase 1 Data Model](phase_1_data_model.png)

Our data model has six different kinds of objects: payment requests, meals, restaurants, meal-payers, meal-participants, restaurants and food items. The diagram above captures their relationships but we will shortly elaborate on how each object interacts with other objects. 

Each meal has one or more payment requests that correspond to participants in the meal owing the meal-payer the amount of their meal. Each payment request is tied to a unique meal. A meal also has one restaurant where the group ate. But a restaurant can have multiple meals. 

A meal also includes a group of people. We represent them as a meal-payer and meal-participants. A meal-payer is the one who paid for the meal and is entering the information in on the application. The leader is looking to get payment back from the other meal-participants. Every meal has one meal-payer and a meal-payer object corresponds to exactly one meal. A meal-payer is a subset of meal-participants. There can be one or more meal-participants in every meal and a meal-participant can be involved in one meal. The meal-participant object is unique to the meal. In the future if we want to have users of the system the meal-participant will also have a user id field that will link it to a user. 

A restaurant then has a list of one or more food items. Each food item only belongs to one restaurant. And then each meal-participant can have one or more food items that he or she ordered during the menu. Each food item corresponds to one or more meal-participants. 

Feature Descriptions
---------------------

**Creating charges for a group:** The payer of a meal can create separate charges for anyone who participated in the meal easily  
**Emails for group charges:** People who owe the meal-payer money receive an email detailing their meal charge  
**Preloaded data wherever possible:** Restaurant names will be preloaded for ease of selection. Menu items and prices can be preloaded for ease of selection. Usernames/emails will also be preloaded if possible  
**Autocompletion:** MealSplit will use autocompletion to make entering in restaurants and food items as simple as possible. When you start typing `chi` the selection for `Alfredo Chicken Pasta` will pop up and you can simply select that item.
**View past transactions:** Users will eventually be able to see their past transactions and levels of completion of each.  
**User accounts:** Users can log in and out to privately view their transactions

Security Concerns
-----------------

###MVP
+ Fake meals created and charges sent
+ Messing with restaurant/meal data
  + only allowing superusers to upload data or pull from Locu

### Full-featured App
+ Fake meals created and charges sent 
  + only registered people can send requests
  + detection if someone is creating fake charges
  + only autocompletes names of friends and past transactors
+ generic account security (e.g. making passwords are hashed, making sure passwords are secure enough, etc.)
+ A malicious party deliberately entering fake restaurant/meal data
  + only allowing superusers to upload data or pull from Locu


User Interface
--------------

![Phase 1 Workflow](phase_1_workflow.png)


