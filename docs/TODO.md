TODO
====

Overview
--------

###Controllers

+ Meals
+ Participants
+ Restaurants

Routes code:

    resources :meals do
        resources :participants
        resources :charges
    end

Tasks
-----