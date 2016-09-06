# lego shop
# customer order a lego car

class Command
  def execute
    raise NotImplementedError
  end
end

class Castle
  def assemble
    puts "assemble a lego castle"
  end

  def dismantle
    puts "dismantle the lego castle"
  end
end

class AssembleLegoCastleCommand < Command
  attr_reader :castle

  def initialize(castle)
    @castle = castle
  end

  def execute
    @castle.assemble
  end
end

class DismantleLegoCastleCommand < Command
  attr_reader :castle

  def initialize(castle)
    @castle = castle
  end

  def execute
    @castle.dismantle
  end
end

class Car
  def assemble
    puts "assemble a lego car"
  end

  def dismantle
    puts "dismantle the lego car"
  end

  def install
    puts "install a engine"
  end

  def uninstall
    puts "uninstall the engine"
  end
end

class AssembleLegoCarCommand < Command
  attr_reader :car

  def initialize(car)
    @car = car
  end

  def execute
    @car.assemble
    @car.install
  end
end

class DismantleLegoCarCommand < Command
  attr_reader :car

  def initialize(car)
    @car = car
  end

  def execute
    @car.uninstall
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

castle = Castle.new
assemble_lego_castle_command = AssembleLegoCastleCommand.new(castle)
dismantle_lego_castle_command = DismantleLegoCastleCommand.new(castle)

car = Car.new
assemble_lego_car_command = AssembleLegoCarCommand.new(car)
dismantle_lego_car_command = DismantleLegoCarCommand.new(car)

menu = Menu.new
menu.set_command(assemble_lego_castle_command, dismantle_lego_castle_command)
menu.set_command(assemble_lego_car_command, dismantle_lego_car_command)


menu.order_button_was_pressed(0)
menu.camcel_button_was_pressed(0)
menu.order_button_was_pressed(1)
menu.camcel_button_was_pressed(1)

