# Command Interface
class Command
  def execute
    raise NotImplementedError
  end
end

class Light
  def on
    puts "light is on"
  end

  def off
    puts "light is off"
  end
end

class LightOnCommand < Command
  attr_reader :light

  def initialize(light)
    @light = light
  end

  def execute
    @light.on
  end
end

class SimpleRemoteControl
  attr_reader :slot

  def initialize(slot)
    @slot = slot
  end

  def button_was_pressed
    @slot.execute
  end
end

class RemoteControl
  attr_reader :on_commands
  attr_reader :off_commands

  def initialize
    @on_commands = Array.new
    @off_commands = Array.new
  end

end

light = Light.new
light_on = LightOnCommand.new(light)
remote = SimpleRemoteControl.new(light_on)
remote.button_was_pressed
