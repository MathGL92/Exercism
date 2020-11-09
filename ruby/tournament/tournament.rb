=begin
Write your code for the 'Tournament' exercise in this file. Make the tests in
`tournament_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/tournament` directory.
=end

class Tournament

  def self.tally(input = "")
    self.headers
  end

  private

  def self.headers
    "Team                           | MP |  W |  D |  L |  P\n"
  end
end
