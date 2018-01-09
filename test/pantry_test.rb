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
end
