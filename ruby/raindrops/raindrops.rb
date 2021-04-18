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

    SOUNDS.each { |prime, sound| output += sound if divisible_by?(num, prime) }

    output.empty? ? num.to_s : output
  end

  def self.divisible_by?(num, divider)
    (num % divider).zero?
  end
end
