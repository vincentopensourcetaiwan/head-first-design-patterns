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

  def dismantle
    puts "dismantle the lego car"
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

class DismantleLegoCarCommand < Command
  attr_reader :car

  def initialize(car)
    @car = car
  end

  def execute
    @car.dismantle
  end
end

class Menu
  attr_reader :order_commands
  attr_reader :cancel_commands

  def initialize
    @order_commands = Array.new
    @cancel_commands = Array.new
  end

  def set_command(order_command, cancel_command)
    @order_commands << order_command
    @cancel_commands << cancel_command
  end

  def order_button_was_pressed(index)
    @order_commands[index].execute
  end

  def camcel_button_was_pressed(index)
    @cancel_commands[index].execute
  end
end

car = Car.new
assemble_lego_car_command = AssembleLegoCarCommand.new(car)
dismantle_lego_car_command = DismantleLegoCarCommand.new(car)

menu = Menu.new
menu.set_command(assemble_lego_car_command, dismantle_lego_car_command)
menu.order_button_was_pressed(0)
menu.camcel_button_was_pressed(0)

