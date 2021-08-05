=begin
Write your code for the 'Difference Of Squares' exercise in this file. Make the tests in
`difference_of_squares_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/difference-of-squares` directory.
=end

# class Squares
#   def initialize(number)
#     @number = number
#   end

#   def square_of_sum
#     (1..@number).to_a.sum**2
#   end

#   def sum_of_squares
#     (1..@number).to_a.sum { |num| num**2 }
#   end

#   def difference
#     square_of_sum - sum_of_squares
#   end

#   private

#   def array_of_natural_numbers_until_number
#     @numbers ||= (1..@number).to_a
#   end
# end

class Squares
  def initialize(number)
    @number = number
  end

  def square_of_sum
    range_to_number.sum**2
  end

  def sum_of_squares
    range_to_number.sum { |num| num**2 }
  end

  def difference
    square_of_sum - sum_of_squares
  end

  private

  def range_to_number
    @range_to_number ||= (1..@number)
  end
end
