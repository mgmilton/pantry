class Pantry
  attr_reader :stock, :stock_check

  def initialize
    @stock = {}
  end

  def stock_check(item)
    @stock.fetch(item, 0)
  end

  def restock(item, quantity)
    @stock[item] = quantity + stock_check(item)
  end

end
