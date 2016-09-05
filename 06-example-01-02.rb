# customer order a meal
# a meal include a buger and a drink

class Order
  def buger
    raise NotImplementedError
  end

  def drink
    raise NotImplementedError
  end

  def meal
    raise NotImplementedError
  end
end

class Cook
  def buger
    puts "make a buger"
  end

  def drink
    puts "make a drink"
  end

  def meal
    puts "make a buger"
    puts "make a drink"
  end
end

class Waitress < Order
  attr_reader :cook

  def initialize(cook)
    @cook = cook
  end

  def place_a_buger_order
    @cook.buger
  end

  def place_a_drink_order
    @cook.drink
  end

  def place_a_meal_order
    @cook.meal
  end
end

class Customer
  attr_reader :waitress

  def initialize(waitress)
    @waitress = waitress
  end

  def order_a_buger
    @waitress.place_a_buger_order
  end

  def order_a_drink
    @waitress.place_a_drink_order
  end

  def order_a_meal
    @waitress.place_a_meal_order
  end
end

cook = Cook.new
waitress = Waitress.new(cook)
customer = Customer.new(waitress)
customer.order_a_meal