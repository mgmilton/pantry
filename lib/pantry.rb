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

  def add_to_shopping_list(recipe)
    shopping_list = recipe.name
    @stock[shopping_list] = recipe.ingredients
  end

  def shopping_list
    items = @stock.values.map do |value|
       value
    end
    items
  end

end
