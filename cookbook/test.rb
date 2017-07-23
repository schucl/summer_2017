require_relative 'recipe'
require_relative 'cookbook'
require_relative 'view'
require_relative 'controller'
require 'csv'

csv_file = "recipes.csv"
recipes = []
cookbook = Cookbook.new(csv_file)
controller = Controller.new(cookbook)
view = View.new

#p cookbook
#p cookbook.all

# cookbook.delete_recipe(1)
# p cookbook.all

#p controller.create
#p controller.list
p controller.destroy
# recipe = Recipe.new(recipe_name, recipe_description)
# p controller.add_recipe(recipe)

