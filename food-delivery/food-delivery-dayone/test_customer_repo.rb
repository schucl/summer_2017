require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/customers_controller'
require_relative 'app/models/customer'
require_relative 'app/models/meal'



csv_file = 'data/customers.csv'
repo = CustomerRepository.new(csv_file)
view = CustomersView.new
controller = CustomersController.new(repo)

# p controller.add
p controller.list

# p repo
# p repo.all
# p repo.find(3)
