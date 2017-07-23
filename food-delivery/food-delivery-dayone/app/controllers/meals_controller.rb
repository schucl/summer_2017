require_relative '../repositories/meal_repository'
require_relative '../views/meals_view'


class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def list
    display_all
  end


  def add
    name = @view.ask_for_name
    price = @view.ask_for_price
    meal = Meal.new(name: name, price: price)
    @meal_repository.add_meal(meal)
    display_all
  end


  def delete
    display_all
    id = @view.ask_for_id
    @meal_repository.delete_meal(id)
    display_all
  end

  private
  def display_all
    meals = @meal_repository.all
    @view.display(meals)
  end
end
