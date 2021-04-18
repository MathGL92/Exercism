=begin
Write your code for the 'Bob' exercise in this file. Make the tests in
`bob_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/bob` directory.
=end

class Bob
  class << self
    def hey(sentence)
      if yelling?(sentence) && question?(sentence)
        "Calm down, I know what I'm doing!"
      elsif yelling?(sentence)
        'Whoa, chill out!'
      elsif question?(sentence)
        'Sure.'
      elsif not_saying_anything(sentence)
        'Fine. Be that way!'
      else
        'Whatever.'
      end
    end

    def yelling?(string)
      string == string.upcase && string.count('a-zA-Z').positive?
    end

    def question?(string)
      string.strip[-1] == '?'
    end

    def not_saying_anything(string)
      string !~ /\S/
    end
  end
end
