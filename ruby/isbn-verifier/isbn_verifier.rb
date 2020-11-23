require 'pry'
=begin
Write your code for the 'ISBN Verifier' exercise in this file. Make the tests in
`isbn_verifier_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/isbn-verifier` directory.
=end

class IsbnVerifier
  def initialize(string)
    @string = string
  end

  def self.valid?(string)
    IsbnVerifier.new(string).valid?
  end

  def valid?
    # delete '-' in string
    delete_hyphens
    # guard clause, return false if other chars than integers or X
    return false unless valid_chars

    # split the string and replace 'X' by 10
    to_array = @string.chars.map { |char| replace_x(char) }.reverse


    sum = formulae(to_array).sum
    sum % 11 == 0
  end

  private

  def replace_x(char)
    char.gsub('X', '10')
  end

  def delete_hyphens
    @string.gsub!('-', '')
  end

  def valid_chars
    @string.match(/^\d{9}[\d|X]$/)
  end

  def formulae(array)
    array.map.with_index do |el, index|
      (index + 1) * el.to_i
    end
  end
end
