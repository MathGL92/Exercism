=begin
Write your code for the 'Matrix' exercise in this file. Make the tests in
`matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/matrix` directory.
=end

class Matrix
  def initialize(matrix_string)
    @matrix = create_matrix(matrix_string)
  end

  def rows
    @matrix
  end

  def columns
    @matrix.transpose
  end

  private

  def create_matrix(matrix_string)
    matrix_string.each_line.map { |row| format_row(row) }
  end

  def format_row(row)
    row.split.map(&:to_i)
  end
end
