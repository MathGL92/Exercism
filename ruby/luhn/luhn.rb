=begin
Write your code for the 'Luhn' exercise in this file. Make the tests in
`luhn_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/luhn` directory.
=end
require 'pry'

class Luhn
  def initialize(digits)
    @digits = digits.gsub(/\s+/, "")
  end

  def self.valid?(digits)
    Luhn.new(digits).valid?
  end

  def valid?
    # guard clause
    return false if @digits.length < 2
    return false if !@digits.scan(/\D/).empty?
    # double every second digit, starting from the right
    new_array = @digits
      .reverse
      .chars
      .map(&:to_i)
      .map.with_index do |digit, ind|
      # doubling the number results in a number greater than 9 then subtract 9 from the product.
      ind % 2 == 0 ? digit : operation_every_double_digit(digit)
    end
    # sum all of the digits
    sum = new_array.reduce(&:+)
    # If the sum is evenly divisible by 10, then the number is valid. This number is valid
    sum % 10 == 0
  end

  private

  def operation_every_double_digit(digit)
    digit * 2 > 9 ? digit * 2 - 9 : digit * 2
  end
end
