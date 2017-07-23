class View
  def display_recipes(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name}: #{recipe.description}"
    end
  end

  def ask_user_for_name
    puts "Please add recipe name:"
    print "> "
    return gets.chomp
  end

  def ask_user_for_description
    puts "Please add recipe description:"
    print "> "
    return gets.chomp
  end

  def ask_user_for_index
    puts "Please choose recipe number"
    print "> "
    gets.chomp.to_i - 1
  end
end
