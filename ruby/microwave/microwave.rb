require 'pry'
=begin
Write your code for the 'Microwave' exercise in this file. Make the tests in
`microwave_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/microwave` directory.
=end

class Microwave
  def initialize(time)
    @time = time
  end

  def timer
    small_time? ? minutes_conversion : split_string
  end

  private

  def small_time?
    @time < 100
  end

  def display_time(minutes, seconds)
    "#{minutes}:#{seconds}"
  end

  def minutes_conversion
    minutes = (@time / 60)
    seconds = (@time % 60)
    display_time(add_zero(minutes, 2), add_zero(seconds, 2))
  end

  def split_string
    minutes, seconds = add_zero(@time, 4).scan(/.{2}/)
    if seconds.to_i >= 60
      seconds = seconds.to_i - 60
      minutes = (minutes.to_i + 1)
    end
    display_time(add_zero(minutes, 2), add_zero(seconds, 2))
  end

  def add_zero(int, dig)
    int.to_s.rjust(dig, '0')
  end
end
