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

class Menu
  attr_reader :slot

  def initialize(slot)
    @slot = slot
  end

  def button_was_pressed
    @slot.execute
  end
end

car = Car.new
assemble_lego_car_command = AssembleLegoCarCommand.new(car)
menu = Menu.new(assemble_lego_car_command)
menu.button_was_pressed

