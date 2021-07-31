# Write your code for the 'Clock' exercise in this file. Make the tests in
# `clock_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/clock` directory.
require 'date'
require 'byebug'

class Clock
  attr_reader :minute, :hour

  def initialize(hour: 0, minute: 0)
    total_minutes = total_minutes(hour, minute)
    @minute = calculate_minute(total_minutes)
    @hour = calculate_hour(total_minutes)
  end

  def to_s
    format('%<hour>02d:%<minute>02d', hour: @hour, minute: @minute)
  end

  def +(other)
    add_or_substract(other, __callee__)
  end

  def -(other)
    add_or_substract(other, __callee__)
  end

  def ==(other)
    to_s == other.to_s
  end

  private

  def add_or_substract(other, method)
    minute = @minute.send(method, other.minute)
    hour = @hour.send(method, other.hour)
    Clock.new(hour: hour, minute: minute).to_s
  end

  def calculate_hour(total_minute)
    total_minute / 60
  end

  def calculate_minute(total_minute)
    total_minute % 60
  end

  def total_minutes(hour, minute)
    (hour * 60 + minute) % (24 * 60)
  end
end
