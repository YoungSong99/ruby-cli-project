require 'minitest/autorun'
require_relative '../recipe_matcher'

class RecipeMatcherTest < Minitest::Test
  def test_find_recipes
    matcher = RecipeMatcher.new(["pasta", "tomato sauce", "salt", "potato"])
    expected = { "Spaghetti" => 100.0, "Potato Salad" => 33.33, "Chicken Salad" => 0.0 }
    assert_equal expected, matcher.find_recipes
  end
end