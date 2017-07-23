class OrdersView
  def display_orders(orders)
    orders.each do |order|
      status = order.delivered? ? [x] : [ ]
      puts "#{order.id}. #{order.customer.name}: #{order.meal.name}, #{order.meal.price}EUR -> delivery status: #{status}, #{order.employee.username}"
    end
  end

  def ask_for_id(label)
    puts "Please type #{label} number"
    print "> "
    gets.chomp.to_i
  end

  def display_employees(employees)
    employees.each do |employee|
      puts "#{employee.id}. #{employee.name}, #{employee.role}"
    end
  end


end
