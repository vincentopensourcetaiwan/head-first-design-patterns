# lego shop
# customer order a lego plane

class Order
  def car
    raise NotImplementedError
  end

  def plane
    raise NotImplementedError
  end
end

class Worker
  def car
    puts "make a lego car"
  end

  def plane
    puts "make a lego plane"
  end
end

class Salesclerk
  attr_reader :worker

  def initialize(worker)
    @worker = worker
  end

  def place_a_car_order
    @worker.car
  end

  def place_a_plane_order
    @worker.plane
  end
end

class Customer
  attr_reader :salesclerk

  def initialize(salesclerk)
    @salesclerk = salesclerk
  end

  def order_a_car
    @salesclerk.place_a_car_order
  end

  def order_a_plane
    @salesclerk.place_a_plane_order
  end
end

worker = Worker.new
salesclerk = Salesclerk.new(worker)
customer = Customer.new(salesclerk)
customer.order_a_plane

