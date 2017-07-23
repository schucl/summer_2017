require_relative 'app/controllers/meals_controller'
require_relative 'app/controllers/customers_controller'
require_relative 'app/controllers/sessions_controller'
require_relative 'app/controllers/orders_controller'


class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running = true
  end

  def run
    puts "****** Welcome, please sign-in *******"
    employee = @sessions_controller.sign_in
    while @running
      employee.manager? ? display_menu_manager : display_menu_delivery_guy
    end
  end

  private

  def display_menu_manager
    puts " "
    puts "What would you like to do?"
    puts "1 - List all meals"
    puts "2 - Add a meal"
    puts "3 - Delete a meal"
    puts "4 - List all customers"
    puts "5 - Add a customer"
    puts "6 - List all undelivered orders"
    puts "7 - Add an order"
    puts "8 - Stop and exit platform"
    puts " "
    print "> "
    action = gets.chomp.to_i
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @meals_controller.delete
    when 4 then @customers_controller.list
    when 5 then @customers_controller.add
    when 6 then @orders_controller.list_undelivered
    when 7 then @orders_controller.add
    when 8 then stop
    end
  end

def display_menu_delivery_guy
    puts " "
    puts "What would you like to do?"
    puts "1 - List all meals"
    puts "2 - Add a meal"
    puts "3 - Delete a meal"
    puts "4 - List all customers"
    puts "5 - Add a customer"
    puts "6 - Stop and exit platform"
    puts " "
    print "> "
    action = gets.chomp.to_i
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @meals_controller.delete
    when 4 then @customers_controller.list
    when 5 then @customers_controller.add
    when 6 then stop
    end
  end

  def stop
    @running = false
  end
end
