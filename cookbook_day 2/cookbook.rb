
require 'csv'
require_relative 'recipe'

class Cookbook
  attr_reader :recipes

  def initialize(csv_file)
    @csv_file = csv_file
    @recipes = []
    CSV.foreach(csv_file) do |row|
      @recipes << Recipe.new(row[0], row[1])
    end
  end

  # 1 list all recipes
  # 2 add a recipe
  # 3 delete a recipe

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    save
  end

  def delete_recipe(index)
    @recipes.delete_at(index)
    save
  end

  private

  def save
    CSV.open(@csv_file, 'w') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end

# Notes: important to have 'w' or won't have the writte rights!!
# Here when we initialize we need to PARSE data, ie transform data into ruby obj
# but if we want to save the user actions, we need to update the csv mirroring
# what we've done in the repo; that's why we create the private method save in which
# we do data STORING

