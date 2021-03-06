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
    else
      @stock[item]
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
    shopping_list = @stock.keys.map do |key|
      ingredients = @stock.fetch(key)
         names = ingredients.keys
         names.each do |item|
           p "#{item} : #{ingredients[item]}"
         end
      end
    shopping_list
  end

  def add_to_cookbook(recipe)
    @cookbook << Recipe.new(recipe)
  end

  def what_can_i_make
    #this method doesn't work
    # @cookbook.select do |recipe|
    #   recipe.name.ingredients.values == amount_required(recipe.name.ingredients.keys)
    # end
  end

end
