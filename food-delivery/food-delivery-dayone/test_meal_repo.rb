require_relative 'app/repositories/meal_repository'
require_relative 'app/models/meal'
require_relative 'app/controllers/meals_controller'
require 'csv'



csv_file = 'data/meals.csv'
repo = MealRepository.new(csv_file)
view = MealsView.new
controller = MealsController.new(repo)

# p repo
# p repo.all
p controller.list
p controller.delete


# meal = Meal.new(name: 'Regina', price: 10)
# p meal

