# As a manager, I can view all the undelivered orders
# As a manager, I can add an order for a customer and assign it to a delivery guy
# As a delivery guy, I can view my undelivered orders
# As a delivery guy, I can mark an order as delivered
require_relative '../repositories/order_repository'
require_relative '../repositories/meal_repository'
require_relative '../repositories/customer_repository'
require_relative '../repositories/employee_repository'
require_relative '../views/orders_view'

class OrdersController
  def initialize(order_repository, meal_repository, customer_repository, employee_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @view = OrdersView.new
  end

  def list_undelivered
    orders = @order_repository.display_undelivered
    @view.display_orders(orders)
  end

  def add
    meal = @view.ask_for_meal
    customer = @view.ask_for_customer
    employee = @view.ask_for_delivery
    order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.add(order)
  end

  private

  def ask_for_meal
    MealsController.new(@meal_repository).list
    id = @view.ask_for_id(:meal)
    @meal_repository.find(id)
  end

  def ask_for_customer
    CustomersController.new(@customer_repository).list
    id = @view.ask_for_id(:customer)
    @customer_repository.find(id)
  end

  def ask_for_delivery
    employees = @employee_repository.all_delivery
    id = @view.display_employee(employees)
    @employee_repository.find(id)
  end
end
