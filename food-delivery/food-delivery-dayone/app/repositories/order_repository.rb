require_relative '../models/order'
require_relative 'meal_repository'
require_relative 'customer_repository'
require_relative 'employee_repository'
require 'csv'

class OrderRepository
  attr_accessor :orders

  def initialize(csv_file, meal_repository, customer_repository, employee_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders = []
    @next_id = 1
    @csv_file = csv_file
    load_csv if File.exist?(@csv_file)
  end

  def all
    @orders
  end

  def add(order)
    @next_id == order.id
    @next_id += 1
    @orders << order
    save
  end

  def find(id)
    order = @orders.find { |order| id == order.id}
  end

  def display_undelivered
    @orders.reject { |order| order.delivered? }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id]    = row[:id].to_i
      row[:delivered] = row[:delivered] == "true"
      row[:meal] = @meal_repository.find(row[:meal_id].to_i)
      row[:customer] = @customer_repository.find(row[:customer_id].to_i)
      row[:employee] = @employee_repository.find(row[:employee_id].to_i)
      @orders << Order.new(row)
      @next_id = @orders.empty? ? 1 : @orders.last.id + 1
    end
  end

  def save
    CSV.open(@csv_file, 'wb') do |csv|
      csv << ["id", "meal_id", "customer_id", "employee_id", "delivered"]
      @orders.each do |order|
        csv << [order.id, order.meal.id, order.customer.id, order.employee.id, order.delivered]
      end
    end
  end
end
