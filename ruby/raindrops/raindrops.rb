=begin
Write your code for the 'Raindrops' exercise in this file. Make the tests in
`raindrops_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/raindrops` directory.
=end

class Raindrops
  def self.convert(num)
    output = ''
    output += 'Pling' if divisible_by?(num, 3)

    output += 'Plang' if divisible_by?(num, 5)

    output += 'Plong' if divisible_by?(num, 7)

    output += num.to_s if output == ''

    output
  end

  def self.divisible_by?(num, divider)
    (num % divider).zero?
  end
end
