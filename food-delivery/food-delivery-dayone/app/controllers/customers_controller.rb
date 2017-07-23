require_relative '../repositories/customer_repository'
require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def list
    display_all
  end


  def add
    name = @view.ask_for_name
    address = @view.ask_for_address
    customer = Customer.new(name: name, address: address)
    @customer_repository.add(customer)
  end

  private

  def display_all
    customers = @customer_repository.all
    @view.display(customers)
  end

end
