require_relative 'app/repositories/employee_repository'
require_relative 'app/controllers/sessions_controller'
require_relative 'app/views/sessions_view'

csv_file = 'data/employees.csv'
repo = EmployeeRepository.new(csv_file)
view = SessionsView.new
controller = SessionsController.new(repo)

p repo
p repo.all
p controller.sign_in
