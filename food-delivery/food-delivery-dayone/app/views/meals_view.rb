class MealsView
  def display(meals)
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name}, #{meal.price}EUR"
    end
  end

  def ask_for_name
    puts "Please enter meal name"
    print "> "
    gets.chomp
  end

  def ask_for_price
    puts "Please enter meal price"
    print "> "
    gets.chomp.to_i
  end

  def ask_for_id
    puts "Choose meal number to delete"
    print "> "
    gets.chomp.to_i
  end

end
