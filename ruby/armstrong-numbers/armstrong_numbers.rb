=begin
Write your code for the 'Armstrong Numbers' exercise in this file. Make the tests in
`armstrong_numbers_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/armstrong-numbers` directory.
=end

class ArmstrongNumbers
  class << self
    def include?(integer)
      digits_array = digits_to_array(integer)
      integer == sum_of_digits_powered_to_the_number_of_digits(digits_array)
    end

    private

    def digits_to_array(integer)
      integer.digits
    end

    def number_of_digits(digits_array)
      digits_array.size
    end

    def sum_of_digits_powered_to_the_number_of_digits(digits_array)
      digits_array.sum { |num| num**number_of_digits(digits_array) }
    end
  end
end
