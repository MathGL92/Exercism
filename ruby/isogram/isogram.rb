=begin
Write your code for the 'Isogram' exercise in this file. Make the tests in
`isogram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/isogram` directory.
=end
class Isogram
  class << self
    def isogram?(string)
      letters = letters_downcased(string)
      no_duplicates?(letters)
    end

    private

    def letters_downcased(string)
      string.downcase.scan(/\w/)
    end

    def no_duplicates?(array)
      array == array.uniq
    end
  end
end
