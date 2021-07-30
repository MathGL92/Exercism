=begin
Write your code for the 'Clock' exercise in this file. Make the tests in
`clock_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/clock` directory.
=end
require 'date'

class Clock
  attr_reader :minute, :hour

  def initialize(hour: nil, minute: nil)
    @date = Date.today
    @hour = 0
    @minute = manage_rolls_over_minute(minute) if minute
    manage_rolls_over_hour(hour)
  end

  def to_s
    Time.new(@date.year, @date.month, @date.day, @hour, @minute).strftime('%H:%M')
  end

  def +(other)
    minute = @minute + other.minute
    hour = @hour + other.hour
    Clock.new(hour: hour, minute: minute).to_s
  end

  def -(other)
    minute = @minute - other.minute
    hour = @hour - other.hour
    Clock.new(hour: hour, minute: minute).to_s
  end

  def ==(other)
    @minute == other.minute && @hour == other.hour
  end

  private

  def manage_rolls_over_hour(hour)
    @hour = (@hour + (hour || 0)) % 24
  end

  def manage_rolls_over_minute(minute)
    @hour += minute / 60
    minute % 60
  end
end
