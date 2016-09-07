# customer order a meal
# a meal include a burger and a drink

class Order
  def burger
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
  def burger
    puts "make a burger"
  end

  def drink
    puts "make a drink"
  end

  def meal
    puts "make a burger"
    puts "make a drink"
  end
end

class Waitress < Order
  attr_reader :cook

  def initialize(cook)
    @cook = cook
  end

  def place_a_burger_order
    @cook.burger
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

  def order_a_burger
    @waitress.place_a_burger_order
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