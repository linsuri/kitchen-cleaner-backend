User.create(name: 'Bob Belcher')
User.create(name: 'Linda Belcher')
User.create(name: 'Tina Belcher')
User.create(name: 'Gene Belcher')
User.create(name: 'Louise Belcher')
###################################################################################
Recipe.create(title: 'Breakfast Burger', category: 'entree')
Recipe.create(title: 'Lunch Burger', category: 'entree')
Recipe.create(title: 'Dinner Burger', category: 'entree')
###################################################################################
UserRecipe.create(marked_as_cooked: true, user_id: 1, recipe_id: 1)
UserRecipe.create(marked_as_cooked: true, user_id: 1, recipe_id: 2)

UserRecipe.create(marked_as_cooked: false, user_id: 2, recipe_id: 2)
UserRecipe.create(marked_as_cooked: false, user_id: 2, recipe_id: 3)

UserRecipe.create(marked_as_cooked: true, user_id: 3, recipe_id: 1)
UserRecipe.create(marked_as_cooked: true, user_id: 3, recipe_id: 3)

UserRecipe.create(marked_as_cooked: false, user_id: 4, recipe_id: 2)
UserRecipe.create(marked_as_cooked: false, user_id: 4, recipe_id: 3)

UserRecipe.create(marked_as_cooked: false, user_id: 5, recipe_id: 1)
UserRecipe.create(marked_as_cooked: true, user_id: 5, recipe_id: 2)
