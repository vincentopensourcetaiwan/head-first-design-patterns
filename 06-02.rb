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

class LightOffCommand < Command
  attr_reader :light

  def initialize(light)
    @light = light
  end

  def execute
    @light.off
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

  def set_command(on_command, off_command)
    @on_commands << on_command
    @off_commands << off_command
  end

  def on_button_was_pushed(index)
    @on_commands[index].execute
  end

  def off_button_was_pushed(index)
    @off_commands[index].execute
  end
end

light = Light.new
light_on = LightOnCommand.new(light)
light_off = LightOffCommand.new(light)

remote = RemoteControl.new
remote.set_command(light_on, light_off)

remote.on_button_was_pushed(0)
remote.off_button_was_pushed(0)