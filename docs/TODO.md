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

+ Mailer
	+ Set up mailer
+ Meal
	+ Choose restaurant view/logic
	+ Participant selection view/logic
	+ Participant view/logic	
	+ Summary page
+ Static pages
	+ Home
+ Autocomplete/autosuggest
	+ How to do this? What gem? Demo?