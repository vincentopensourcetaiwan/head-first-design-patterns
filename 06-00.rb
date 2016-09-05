# customer order a buger

class Order
  def cook
    raise NotImplementedError
  end
end

class Cook
  def cook
    puts "make a buger"
  end
end

class Waitress < Order
  attr_reader :cook

  def initialize(cook)
    @cook = cook
  end

  def place_order
    @cook.cook
  end
end


class Customer
  attr_reader :waitress

  def initialize(waitress)
    @waitress = waitress
  end

  def order
    @waitress.place_order
  end
end

cook = Cook.new
waitress = Waitress.new(cook)
customer = Customer.new(waitress)
customer.order