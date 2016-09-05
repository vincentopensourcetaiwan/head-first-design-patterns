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
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def on
    puts "#{@location} stereo is on"
  end

  def off
    puts "#{@location} stereo is off"
  end

  def set_cd
    puts "#{@location} stereo is set for CD input"
  end

  def set_dvd
    puts "#{@location} stereo is set for DVD input"
  end

  def set_radio
    puts "#{@location} stereo is set for Radio"
  end

  def set_volume(volume)
    puts "#{@location} stereo volume set to #{volume}"
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

class CeilingFan
  attr_reader :location
  attr_reader :level
  HIGH = 2
  MEDIUM = 1
  LOW = 0

  def initialize(location)
    @level = HIGH
    @location = location
  end

  def high
    @level = HIGH
    puts "#{@location} ceiling fan is on high"
  end

  def medium
    @level = MEDIUM
    puts "#{@location} ceiling fan is on medium"
  end

  def low
    @level = LOW
    puts "#{@location} ceiling fan is on low"
  end

  def off
    puts "#{@location} ceiling fan is off"
  end

  def speed
    @level
  end
end

class CeilingFanOnCommand < Command
  attr_reader :ceiling_fan

  def initialize(ceiling_fan)
    @ceiling_fan = ceiling_fan
  end

  def execute
    @ceiling_fan.high
  end
end

class CeilingFanOffCommand < Command
  attr_reader :ceiling_fan

  def initialize(ceiling_fan)
    @ceiling_fan = ceiling_fan
  end

  def execute
    @ceiling_fan.off
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

living_room_stereo = Stereo.new("living room")
living_room_stereo_on = StereoOnWithCDCommand.new(living_room_stereo)
living_room_stereo_off = StereotOffCommand.new(living_room_stereo)

living_room_ceiling_fan = CeilingFan.new("living room")
living_room_ceiling_fan_on = CeilingFanOnCommand.new(living_room_ceiling_fan)
living_room_ceiling_fan_off = CeilingFanOffCommand.new(living_room_ceiling_fan)

remote = RemoteControl.new
remote.set_command(living_room_light_on, living_room_light_off)
remote.set_command(kitchen_light_on, kitchen_light_off)
remote.set_command(living_room_stereo_on, living_room_stereo_off)
remote.set_command(living_room_ceiling_fan_on, living_room_ceiling_fan_off)

remote.on_button_was_pushed(0)
remote.off_button_was_pushed(0)
remote.on_button_was_pushed(1)
remote.off_button_was_pushed(1)
remote.on_button_was_pushed(2)
remote.off_button_was_pushed(2)
remote.on_button_was_pushed(3)
remote.off_button_was_pushed(3)