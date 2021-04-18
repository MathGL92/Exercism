=begin
Write your code for the 'Raindrops' exercise in this file. Make the tests in
`raindrops_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/raindrops` directory.
=end

class Raindrops
  SOUNDS = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }.freeze

  def self.convert(num)
    output = ''

    [3, 5, 7].each { |factor| output += SOUNDS[factor] if divisible_by?(num, factor) }

    output.empty? ? num.to_s : output
  end

  def self.divisible_by?(num, divider)
    (num % divider).zero?
  end
end
