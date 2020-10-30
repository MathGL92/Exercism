=begin
Write your code for the 'Resistor Color Duo' exercise in this file. Make the tests in
`resistor_color_duo_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/resistor-color-duo` directory.
=end

class ResistorColorDuo
  COLORS = %w(black brown red orange yellow green blue violet grey white)

  def self.value(array)
    # input array of color names
    # only keep 2 first elements of array
    # iterate through array and replace each element by the index of this element in COLORS, join them , transform to integer
    array.first(2).map.with_index { |color, index| COLORS.index(color) }.join('').to_i
    # output 2 digit integer (even if more than 2 colors)
  end
end
