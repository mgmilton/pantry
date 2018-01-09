require './lib/recipe'

class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(item)
    @stock.fetch(item, 0)
  end

  def restock(item, quantity)
    @stock[item] = quantity + stock_check(item)
  end

  def shopping_list(recipe)
    recipe.ingredients
  end

  def add_to_shopping_list(recipe)

  end

end
