class RecipeMatcher
  RECIPES = {
    "Spaghetti" => ["pasta", "tomato sauce", "salt"],
    "Potato Salad" => ["potato", "mayonnaise", "onion"],
    "Chicken Salad" => ["chicken", "lettuce", "dressing"],
    "Beef Stew" => ["beef", "carrot", "potato", "onion", "celery"],
    "Vegetarian Chili" => ["bean", "tomato", "onion", "bell pepper", "chili powder"],
    "Fish Tacos" => ["fish", "tortilla", "cabbage", "lime", "avocado"],
    "Pancakes" => ["flour", "egg", "milk", "butter", "sugar"],
    "Caesar Salad" => ["lettuce", "crouton", "parmesan cheese", "Caesar dressing"],
    "BBQ Chicken Pizza" => ["pizza dough", "chicken", "bbq sauce", "mozzarella cheese", "red onion"],
    "Mushroom Risotto" => ["rice", "mushroom", "chicken broth", "parmesan cheese", "onion"],
    "Tomato Soup" => ["tomato", "chicken broth", "onion", "carrot", "celery"]
  }

  def initialize(ingredients = [])
    @ingredients = ingredients
  end

  def see_ingredients
    puts "Available ingredients:"
    RECIPES.values.flatten.uniq.sort.each { |ingredient| puts ingredient }
  end

  def enter_ingredients
    puts "Enter your ingredients (type 'done' when finished):"
    loop do
      ingredient = gets.chomp.downcase
      break if ingredient == 'done'
      @ingredients << ingredient
      puts "#{ingredient} added."
    end
  end

  def print_matches
    puts "Possible recipe list based on current ingredients:"
    matches = find_recipes
    if matches.empty?
      puts "No matches found."
    else
      matches.each do |recipe, percentage|
        puts "#{recipe}: #{percentage}% match"
      end
    end
  end

  def find_recipes
    matches = {}

    RECIPES.each do |name, recipe_ingredients|
      match_percentage = (recipe_ingredients & @ingredients).count.to_f / recipe_ingredients.count
      matches[name] = (match_percentage * 100).round(2) if match_percentage > 0
    end

    matches.sort_by { |_, percentage| -percentage }.to_h
  end

  def run
    loop do
      puts "\nWelcome to the Recipe Matcher!"
      puts "1. List all Ingredients"
      puts "2. Enter the ingredients you have"
      puts "3. See the possible recipes based on the ingredients you have"
      puts "4. Exit"
      print "Choose an option: "
      option = gets.chomp.to_i
      puts "\n"
      case option
      when 1
        see_ingredients
      when 2
        enter_ingredients
      when 3
        print_matches
      when 4
        puts "Exiting..."
        break
      else
        puts "Invalid option."
      end
    end
  end
end
