=begin
Write your code for the 'Isogram' exercise in this file. Make the tests in
`isogram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/isogram` directory.
=end
require 'byebug'

class Isogram
  class << self
    def isogram?(string)
      repetition_of_each_letter = number_of_repetitions_for_each_letter(string)

      are_equal_to_1?(repetition_of_each_letter.values)
    end

    private

    def number_of_repetitions_for_each_letter(string)
      letters_downcased(string).each_with_object(Hash.new(0)) do |char, hash|
        hash[char] += 1
      end
    end

    def letters_downcased(string)
      string.downcase.scan(/\w/)
    end

    def are_equal_to_1?(values)
      values.all? { |num| num == 1 }
    end
  end
end
