class Squares
  def initialize(number)
    @number = number
  end

  def square_of_sum
    range_to_number.sum.abs2
  end

  def sum_of_squares
    range_to_number.sum(&:abs2)
  end

  def difference
    square_of_sum - sum_of_squares
  end

  private

  def range_to_number
    @range_to_number ||= 1.upto(@number)
  end
end
