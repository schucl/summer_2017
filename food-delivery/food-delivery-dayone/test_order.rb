require_relative 'app/repositories/order_repository'
require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/customer_repository'
require_relative 'app/repositories/employee_repository'

require_relative 'app/models/order'
require_relative 'app/models/meal'
require_relative 'app/models/employee'
require_relative 'app/models/customer'


csv_file_meal = 'data/meals.csv'
csv_file_customer = 'data/customers.csv'
csv_file_employee = 'data/employees.csv'

meal_repository = MealRepository.new(csv_file_meal)
customer_repository = CustomerRepository.new(csv_file_customer)
employee_repository = EmployeeRepository.new(csv_file_employee)

csv_file_order = "data/orders.csv"
repo = OrderRepository.new(csv_file_order, meal_repository, customer_repository, employee_repository)

# order = Order.new(
#   delivered: false,
#   meal: Meal.new(id: 1),
#   customer: Customer.new(id: 1),
#   employee: Employee.new(id: 1)
#   )

p repo.all
p repo.display_undelivered
# p repo.add(order)
