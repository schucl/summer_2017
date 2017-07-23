class SessionsView
  def ask_for_username
    puts "Please enter your username"
    print "> "
    gets.chomp
  end

   def ask_for_password
    puts "Please enter your password"
    print "> "
    gets.chomp
  end

  def welcome(employee)
    puts "Welcome #{employee.username} to the food-delivery platform"
  end

  def wrong_credentials
    puts "Sorry, wrong username or password please try again"
  end
end
