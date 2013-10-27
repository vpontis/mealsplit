MealSplit - Phase 2 Design Doc
==============================
Authors
-------
+ Victor Pontis
+ Tyler Singer-Clark
+ Emily Zhang

Data Model
----------
![Phase 2 Data Model](phase_2_data_model.png)

In our data model for the MVP, we have removed the Payment Request model. We realized that the payment request gets constructed and then used for the last time in quick succession, so there is no need to persist it as a model in the database. Its information is held in the other models, so the calculations can happen, and the request can be sent out, without the idea of a Payment Request object. Since simpler is better when there are unnecessary things, we chose to scrap it for Phase 2. Perhaps in the final version, if there are user accounts that would like to remember what payment requests are pending, have ever existed, etc., the idea of a Payment Request object might be more relevant and useful, but for our MVP it makes the most sense to not include it in the data model.
