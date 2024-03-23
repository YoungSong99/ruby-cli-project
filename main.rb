require_relative 'recipe_matcher'

puts "Please enter the ingredients you have (separated by commas):"
input = gets.chomp
ingredients = input.split(",").map(&:strip)

matcher = RecipeMatcher.new(ingredients)
matcher.print_matches