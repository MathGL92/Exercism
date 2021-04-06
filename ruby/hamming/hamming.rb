=begin
Write your code for the 'Hamming' exercise in this file. Make the tests in
`hamming_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/hamming` directory.
=end
class Hamming
  def self.compute(dna1, dna2)
    raise ArgumentError if dna1.size != dna2.size

    dna1.chars.map.with_index do |dna, index|
      dna != dna2[index] ? 1 : 0
    end.sum
  end
end
