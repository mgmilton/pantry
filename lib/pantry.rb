require './lib/recipe'

class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(item)
    if @stock[item] == nil
      return 0
    else @stock[item]
    end
  end

  def restock(item, quantity)
    @stock[item] = quantity + stock_check(item)
  end

  def add_to_shopping_list(recipe)
    @stock[recipe.name] = recipe.ingredients
  end

  def shopping_list
    @stock.values
  end

  def print_shopping_list
    keys = @stock.keys
    keys.map do |key|
      ingredients = @stock.fetch(key)
         names = ingredients.keys
         names.each do |item|
           puts "#{item} : #{ingredients[item]}"
         end
      end
  end

end
