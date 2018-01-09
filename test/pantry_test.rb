require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/pantry'

class PantryTest < Minitest::Test

  def test_it_exists
    pantry = Pantry.new
    assert_instance_of Pantry, pantry
  end

  def test_stock_returns_a_hash
    pantry = Pantry.new
    assert_instance_of Hash, pantry.stock
  end

  def test_stock_check_retuns_zero
    pantry = Pantry.new
    assert_equal 0, pantry.stock_check("Cheese")
  end

  def test_restock_adds_items_to_stock
    pantry = Pantry.new
    pantry.restock("Cheese", 10)

    assert_equal 10, pantry.stock_check("Cheese")
  end

  def test_restock_reassigns_items_to_stock
    pantry = Pantry.new

    pantry.restock("Cheese", 10)

    pantry.restock("Cheese", 20)

    assert_equal 30, pantry.stock_check("Cheese")
  end

  def test_shopping_list_returns_ingredients
    recipe = Recipe.new("Cheese Pizza")
    recipe.add_ingredient("Cheese", 20)
    recipe.add_ingredient("Flour", 20)
    pantry = Pantry.new
    pantry.add_to_shopping_list(recipe)

    assert_equal [{"Cheese"=>20, "Flour"=>20}],
    pantry.shopping_list
  end

  def test_shopping_list_returns_works_for_multiple_recipes
    recipe = Recipe.new("Cheese Pizza")
    recipe.add_ingredient("Cheese", 20)
    recipe.add_ingredient("Flour", 20)
    pantry = Pantry.new
    pantry.add_to_shopping_list(recipe)


    r = Recipe.new("Spaghetti")
    r.add_ingredient("Spaghetti Noodles", 10)
    r.add_ingredient("Marinara Sauce", 10)
    r.add_ingredient("Cheese", 5)
    pantry.add_to_shopping_list(r)

    assert_equal [{"Cheese"=>20, "Flour"=>20}, {"Spaghetti Noodles"=>10, "Marinara Sauce"=>10, "Cheese"=>5}], pantry.shopping_list
  end

  def test_print_shopping_list_returns
    recipe = Recipe.new("Cheese Pizza")
    recipe.add_ingredient("Cheese", 20)
    recipe.add_ingredient("Flour", 20)
    pantry = Pantry.new
    pantry.add_to_shopping_list(recipe)


    r = Recipe.new("Spaghetti")
    r.add_ingredient("Spaghetti Noodles", 10)
    r.add_ingredient("Marinara Sauce", 10)
    r.add_ingredient("Cheese", 5)
    pantry.add_to_shopping_list(r)

    assert_equal 0, pantry.print_shopping_list
  end

end
