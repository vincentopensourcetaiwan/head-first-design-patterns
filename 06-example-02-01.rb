# lego shop
# customer order a lego car

class Command
  def execute
    raise NotImplementedError
  end
end

class Car
  def assemble
    puts "assemble a lego car"
  end
end

class AssembleLegoCarCommand < Command
  attr_reader :car

  def initialize(car)
    @car = car
  end

  def execute
    @car.assemble
  end
end

class Customer
  attr_reader :button

  def initialize(button)
    @button = button
  end

  def button_was_pressed
    @button.execute
  end
end

car = Car.new
assemble_lego_car_command = AssembleLegoCarCommand.new(car)
customer = Customer.new(assemble_lego_car_command)
customer.button_was_pressed

