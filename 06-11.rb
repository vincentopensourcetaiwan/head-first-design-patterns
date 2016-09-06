# Command Interface
class Command
  def execute
    raise NotImplementedError
  end

  def undo
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

  def undo
    @light.off
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

  def undo
    @light.on
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
  HIGH = 3
  MEDIUM = 2
  LOW = 1
  OFF = 0

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
  attr_reader :prevSpeed

  def initialize(ceiling_fan)
    @ceiling_fan = ceiling_fan
  end

  def execute
    @prevSpeed = @ceiling_fan.speed
    @ceiling_fan.off
  end

  def undo
    case @prevSpeed
    when CeilingFan::HIGH
      @ceiling_fan.high
    when CeilingFan::MEDIUM
      @ceiling_fan.medium
    when CeilingFan::LOW
      @ceiling_fan.low
    when CeilingFan::OFF
      @ceiling_fan.off
    end
  end
end

class CeilingFanHighCommand < Command
  attr_reader :ceiling_fan
  attr_reader :prevSpeed

  def initialize(ceiling_fan)
    @ceiling_fan = ceiling_fan
  end

  def execute
    @prevSpeed = @ceiling_fan.speed
    @ceiling_fan.high
  end

  def undo
    case @prevSpeed
    when CeilingFan::HIGH
      @ceiling_fan.high
    when CeilingFan::MEDIUM
      @ceiling_fan.medium
    when CeilingFan::LOW
      @ceiling_fan.low
    when CeilingFan::OFF
      @ceiling_fan.off
    end
  end
end

class RemoteControl
  attr_reader :on_commands
  attr_reader :off_commands
  attr_reader :undo_command

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
    @undo_command = @on_commands[index]
  end

  def off_button_was_pushed(index)
    @off_commands[index].execute
    @undo_command = @off_commands[index]
  end

  def undo_button_was_pushed
    @undo_command.undo
  end
end

class TV
  attr_reader :location
  attr_reader :channel

  def initialize(location)
    @location = location
  end

  def on
    puts "#{@location} TV is on"
  end

  def off
    puts "#{@location} TV is off"
  end

  def set_input_channel
    @channel = 3
    put "#{@location} TV channel is set for DVD"
  end
end

class TVOnCommand < Command
  attr_reader :tv

  def initialize(tv)
    @tv = tv
  end

  def execute
    @tv.on
  end

  def undo
    @tv.off
  end
end

class TVOffCommand < Command
  attr_reader :tv

  def initialize(tv)
    @tv = tv
  end

  def execute
    @tv.off
  end

  def undo
    @tv.on
  end
end

class MacroCommand < Command
  attr_reader :commands

  def initialize(commands)
    @commands = commands
  end

  def execute
    @commands.each do |command|
      command.execute
    end
  end

  def undo
    @commands.each do |command|
      command.undo
    end
  end
end

class Hottub
  attr_reader :on
  attr_reader :temperature

  def initialize
    @temperature = Random.new.rand(0..100)
  end

  def on
    @on = true
  end

  def off
    @on = false
  end

  def circulate
    puts "Hottub is bubbling!"
  end

  def jets_on
    puts "Hottub jets are on"
  end

  def jets_off
    puts "Hottub jets are off"
  end

  def set_temperature(temperature)
    if temperature > @temperature
      puts "Hottub is heating to a steaming #{temperature} degrees"
    else
      puts "Hottub is cooling to #{temperature} degrees"
    end
    @temperature = temperature
  end
end

class HottubOnCommand < Command
  attr_reader :hottub

  def initialize(hottub)
    @hottub = hottub
  end

  def execute
    @hottub.on
    @hottub.set_temperature(104)
    @hottub.circulate
  end

  def undo
    @hottub.off
  end
end

class HottubOffCommand < Command
  attr_reader :hottub

  def initialize(hottub)
    @hottub = hottub
  end

  def execute
    @hottub.set_temperature(98)
    @hottub.off
  end

  def undo
    @hottub.on
  end
end

class Timer
  attr_reader :time

  def on
    puts "Timer is on"
  end

  def off
    puts "Timer is off"
  end

  def set_time(time)
    @time = time
    puts "Timer is set to #{@time}"
  end
end

class TimerOnCommand < Command
  attr_reader :timer

  def initialize(timer)
    @timer = timer
  end

  def execute
    @timer.on
    @timer.set_time("00:00")
  end

  def undo
    @timer.off
  end
end

class TimerOffCommand < Command
  attr_reader :timer

  def initialize(timer)
    @timer = timer
  end

  def execute
    @timer.off
  end

  def undo
    @timer.on
    @timer.set_time("00:00")
  end
end

timer = Timer.new
timer_on = TimerOnCommand.new(timer)
timer_off = TimerOffCommand.new(timer)
remote = RemoteControl.new
remote.set_command(timer_on, timer_off)
remote.on_button_was_pushed(0)
remote.off_button_was_pushed(0)
remote.undo_button_was_pushed




