require_relative 'router'
require_relative 'app/controllers/meals_controller'
require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/customers_controller'
require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/sessions_controller'
require_relative 'app/repositories/employee_repository'
require_relative 'app/controllers/orders_controller'
require_relative 'app/repositories/order_repository'

csv_file1 = 'data/meals.csv'
meal_repository = MealRepository.new(csv_file1)
controller1 = MealsController.new(meal_repository)

csv_file2 = 'data/customers.csv'
customer_repository = CustomerRepository.new(csv_file2)
controller2 = CustomersController.new(customer_repository)

csv_file3 = 'data/employees.csv'
employee_repository = EmployeeRepository.new(csv_file3)
controller3 = SessionsController.new(employee_repository)

csv_file4 = 'data/orders.csv'
order_repository = OrderRepository.new(csv_file4, meal_repository, customer_repository, employee_repository)
controller4 = OrdersController.new(order_repository, meal_repository, customer_repository, employee_repository)

router = Router.new(controller1, controller2, controller3, controller4)
router.run
