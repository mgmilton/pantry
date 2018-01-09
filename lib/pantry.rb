require './lib/recipe'

class Pantry
  attr_reader :stock, :cookbook

  def initialize
    @stock = {}
    @cookbook = []
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
    @stock.keys.map do |key|
      ingredients = @stock.fetch(key)
         names = ingredients.keys
         names.each do |item|
           p "#{item} : #{ingredients[item]}"
         end
      end
  end

  def add_to_cookbook(recipe)
    @cookbook << Recipe.new(recipe)
  end

  def what_can_i_make
    @cookbook

    require 'pry' ; binding.pry
  end

end
