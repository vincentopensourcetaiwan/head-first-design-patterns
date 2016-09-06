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

class Menu
  attr_reader :slot

  def initialize(slot)
    @slot = slot
  end

  def button_was_pressed
    @slot.execute
  end
end

castle = Castle.new
assemble_lego_castle_command = AssembleLegoCastleCommand.new(castle)
menu = Menu.new(assemble_lego_castle_command)
menu.button_was_pressed

