class CustomersView
  def display(customers)
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name} [#{customer.address}]"
    end
  end

  def ask_for_name
    puts "Please enter customer name"
    print "> "
    gets.chomp
  end

  def ask_for_address
    puts "Please enter customer address"
    print "> "
    gets.chomp
  end
end
