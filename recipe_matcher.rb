# recipe_matcher.rb

class RecipeMatcher
  attr_accessor :ingredients

  def initialize(ingredients = [])
    @ingredients = ingredients
  end

  def find_recipes
    recipes = {
      "Spaghetti" => ["pasta", "tomato sauce", "salt"],
      "Potato Salad" => ["potato", "mayonnaise", "onion"],
      "Chicken Salad" => ["chicken", "lettuce", "dressing"]
    }

    matches = {}

    recipes.each do |name, recipe_ingredients|
      match_percentage = (recipe_ingredients & @ingredients).count.to_f / recipe_ingredients.count
      matches[name] = (match_percentage * 100).round(2)
    end

    matches.sort_by { |_, percentage| -percentage }.to_h
  end

  def print_matches
    puts "Possible recipe list:"
    find_recipes.each do |recipe, percentage|
      puts "#{recipe}: #{percentage}% match"
    end
  end
end
