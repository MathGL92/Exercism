=begin
Write your code for the 'Bob' exercise in this file. Make the tests in
`bob_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/bob` directory.
=end

class Bob
  class << self
    def hey(sentence)
      if yelling_question?(sentence) then "Calm down, I know what I'm doing!"
      elsif yelling?(sentence) then 'Whoa, chill out!'
      elsif question?(sentence) then 'Sure.'
      elsif not_saying_anything?(sentence) then 'Fine. Be that way!'
      else
        'Whatever.'
      end
    end

    private

    def yelling?(string)
      string == string.upcase && string.count('a-zA-Z').positive?
    end

    def question?(string)
      string.strip[-1] == '?'
    end

    def not_saying_anything?(string)
      string !~ /\S/
    end

    def yelling_question?(string)
      yelling?(string) && question?(string)
    end
  end
end
