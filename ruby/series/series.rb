=begin
Write your code for the 'Series' exercise in this file. Make the tests in
`series_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/series` directory.
=end

class Series
  def initialize(string)
    @digits = string.chars
  end

  def slices(num)
    raise ArgumentError if num > @digits.size

    @digits.each_cons(num).map(&:join)
  end
end
