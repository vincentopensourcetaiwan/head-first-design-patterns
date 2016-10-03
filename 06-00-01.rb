# customer order a burger

class Order
  def burger
    raise NotImplementedError
  end
end

class Cook < Order
  def burger
    puts "make a buger"
  end
end

class Waitress
  attr_reader :cook

  def initialize(cook)
    @cook = cook
  end

  def place_order
    @cook.burger
  end
end

class Customer
  attr_reader :waitress

  def initialize(waitress)
    @waitress = waitress
  end

  def order_a_burger
    @waitress.place_order
  end
end

cook = Cook.new
waitress = Waitress.new(cook)
customer = Customer.new(waitress)
customer.order_a_burger