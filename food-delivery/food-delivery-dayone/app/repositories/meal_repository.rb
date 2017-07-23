require 'csv'
require_relative '../models/meal'

class MealRepository
  attr_accessor :meals

  def initialize(csv_file)
    @meals = []
    @csv_file = csv_file
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def all
    @meals
  end

  def add_meal(meal)
    meal.id = @next_id
    @next_id += 1
    @meals << meal
    save
  end

  def find(id)
    meal = @meals.find { |meal| meal.id == id }
  end

  def delete_meal(id)
    meal = @meals.find { |meal| meal.id == id }
    index = @meals.index(meal)
    @meals.delete_at(index)
    save
  end

  private
  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id]    = row[:id].to_i
      row[:price] = row[:price].to_i
      @meals << Meal.new(row)
      @next_id = @meals.empty? ? 1 : @meals.last.id + 1
    end
  end

  def save
    CSV.open(@csv_file, 'wb') do |csv|
      csv << ["id","name","price"]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end
