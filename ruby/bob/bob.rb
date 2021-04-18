=begin
Write your code for the 'Bob' exercise in this file. Make the tests in
`bob_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/bob` directory.
=end

class Bob
  class << self
    def hey(message)
      phrase = Phrase.new(message)

      if phrase.yelling_question? then "Calm down, I know what I'm doing!"
      elsif phrase.yelling? then 'Whoa, chill out!'
      elsif phrase.question? then 'Sure.'
      elsif phrase.silence? then 'Fine. Be that way!'
      else
        'Whatever.'
      end
    end
  end
end

class Phrase
  def initialize(message)
    @message = message
  end

  def yelling?
    all_uppercase? && letters?
  end

  def question?
    @message.strip[-1] == '?'
  end

  def silence?
    @message !~ /\S/
  end

  def yelling_question?
    yelling? && question?
  end

  private

  def letters?
    @message.count('a-zA-Z').positive?
  end

  def all_uppercase?
    @message == @message.upcase
  end
end
