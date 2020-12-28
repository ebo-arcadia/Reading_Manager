### Specs:

[x] Using Ruby on Rails for the project
    - App is generated using [Rails new Reading_manager]
[x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
    - Reader has many lists
    - List has many books
[x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    - List belongs to user
    - Book belongs to list
[x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    - Reader has many books through list
[x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    - List has many genres
    - Genre has many lists
[x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
    - books.lists.title
[x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    - validations of presence, uniqueness , and more are added for Reader, List, and books
[x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    - scope method enables lists listed in alpha order
[x] Include signup
    - session
[x] Include login
    - session
[x] Include logout
    - session
[x] Include third party signup/login (how e.g. Devise/OmniAuth)
    - Google OAuth is used
[x] Include nested resource show or index (URL e.g. users/2/recipes)
    - readers/:id/lists/index
    - lists/:id/books/show
[x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
    - lists/:id/books/new
[x] Include form display of validation errors (form URL e.g. /recipes/new)
    - views/layouts/_errors.html.erb display error messages

# Confirm:

[x] The application is pretty DRY
    - refactored & private methods are used for repetitive codes
[x] Limited logic in controllers
    - confirmed (most logic in models)
[x] Views use helper methods if appropriate
    - method a_reader_or_all_readers_reading_list in list helper
[x] Views use partials if appropriate
    - views/layouts/_errors.html.erb