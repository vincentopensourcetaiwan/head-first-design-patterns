# Command Interface
class Command
  def execute
    raise NotImplementedError
  end
end

class Light
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def on
    puts "#{@location} light is on"
  end

  def off
    puts "#{@location} light is off"
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

class Stereo
  def on
    puts "stereo is on"
  end

  def off
    puts "stereo is off"
  end

  def set_cd
    puts "stereo is set for CD input"
  end

  def set_dvd
    puts "stereo is set for DVD input"
  end

  def set_radio
    puts "stereo is set for Radio"
  end

  def set_volume(volume)
    puts "Stereo volume set to #{volume}"
  end
end

class StereoOnWithCDCommand < Command
  attr_reader :stereo

  def initialize(stereo)
    @stereo = stereo
  end

  def execute
    @stereo.on
    @stereo.set_cd
    @stereo.set_volume(11)
  end
end

class StereotOffCommand < Command
  attr_reader :stereo

  def initialize(stereo)
    @stereo = stereo
  end

  def execute
    @stereo.off
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

living_room_light = Light.new("living room")
living_room_light_on = LightOnCommand.new(living_room_light)
living_room_light_off = LightOffCommand.new(living_room_light)

kitchen_light = Light.new("kitchen")
kitchen_light_on = LightOnCommand.new(kitchen_light)
kitchen_light_off = LightOffCommand.new(kitchen_light)

remote = RemoteControl.new
remote.set_command(living_room_light_on, living_room_light_off)
remote.set_command(kitchen_light_on, kitchen_light_off)

remote.on_button_was_pushed(0)
remote.off_button_was_pushed(0)
remote.on_button_was_pushed(1)
remote.off_button_was_pushed(1)