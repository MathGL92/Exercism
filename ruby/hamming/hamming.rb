=begin
Write your code for the 'Hamming' exercise in this file. Make the tests in
`hamming_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/hamming` directory.
=end
class Hamming
  def self.compute(dna1, dna2)
    raise ArgumentError if different_size?(dna1, dna2)

    0.upto(dna1.size).count { |i| dna1[i] != dna2[i] }
  end

  def self.different_size?(dna1, dna2)
    dna1.size != dna2.size
  end
end
