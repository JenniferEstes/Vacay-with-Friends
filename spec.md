# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
  
        Used the Rails framework written in the Ruby programming language
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
  
        Group has many vacations. User has many goals. Vacation has many goals.
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
  
        Goal belongs to user and vacation. Vacation belongs to group.
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
  
        User has many vacations through groups. Vacation has many users through groups.
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)

        Direct relationship: User has and belongs to many groups. Group has and belongs to many users. Indirect relationship: User has many vacations through groups. Vacation has many users through groups.
  
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)

        groups has an attribute of name. 
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)

        Certain attributes of User, goal, and vacation models are validated for their presense, uniqueness, and length.
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

        Vacation model has a scope method most_recent that is chainable because of the usage of the .where activerecord query method on it.
- [x] Include signup 
  
        User can sign up by entering a form. 
- [x] Include login
  
        User can log in by entering a form or signing in with github.
  
- [x] Include logout
  
        User can log out, but only if they are logged in.
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
  
        User can sign into Github via OmniAuth.
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
  
        Goals are nested under vacations and vacations are nested under groups.
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
  
        Vcations has a new form.
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

        If user is unable to create a group, user will recieve a flash notice.
Confirm:
- [x] The application is pretty DRY 
  
          Helper and private methods were used across the controllers.
- [x] Limited logic in controllers
  
        This was achieved with the use of helper and private methods, as well as, the CRUD design style.
- [x] Views use helper methods if appropriate

        _nav partial view uses the logged_in? helper method.
  
- [x] Views use partials if appropriate
  
        Layout view uses _nav partial and _bottom (another nav bar) partials.