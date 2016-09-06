# lego shop
# customer order a lego car

class Order
  def car
    raise NotImplementedError
  end
end

class Worker
  def car
    puts "make a lego car"
  end
end

class Salesclerk
  attr_reader :worker

  def initialize(worker)
    @worker = worker
  end

  def place_order
    @worker.car
  end
end

class Customer
  attr_reader :salesclerk

  def initialize(salesclerk)
    @salesclerk = salesclerk
  end

  def order_a_car
    @salesclerk.place_order
  end
end

worker = Worker.new
salesclerk = Salesclerk.new(worker)
customer = Customer.new(salesclerk)
customer.order_a_car

