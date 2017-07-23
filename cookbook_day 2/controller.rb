require_relative 'cookbook'
require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_recipes
  end

  def create
    recipe_name = @view.ask_user_for_name
    recipe_description = @view.ask_user_for_description
    recipe = Recipe.new(recipe_name, recipe_description)
    @cookbook.add_recipe(recipe)
    display_recipes
  end

  def destroy
    display_recipes
    index = @view.ask_user_for_index
    @cookbook.delete_recipe(index)
    display_recipes
  end

  private
  def display_recipes
    recipes = @cookbook.all
    @view.display_recipes(recipes)
  end

end
