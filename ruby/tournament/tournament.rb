=begin
Write your code for the 'Tournament' exercise in this file. Make the tests in
`tournament_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/tournament` directory.
=end
require "pry"

class Tournament

  def self.tally(input = "\n")
    if input == "\n"
      return self.display_headers
    else
      # split input into array
      array_results = input.strip.split(';')
      # initialize teams array
      teams = []
      # initialize teams hashes
      team1 = { name: array_results[0], MP: 1, W: 0, D: 0, L: 0, P: 0 }
      team2 = { name: array_results[1], MP: 1, W: 0, D: 0, L: 0, P: 0 }
      if array_results[2] == "win"
        team1[:W] += 1
        team1[:P] += 3
        team2[:L] += 1
        team2[:P] += 0
      elsif array_results[2] == "loss"
        team1[:L] += 1
        team1[:P] += 0
        team2[:W] += 1
        team2[:P] += 3
      else
        team1[:D] += 1
        team1[:P] += 1
        team2[:D] += 1
        team2[:P] += 1
      end
      teams << team1
      teams << team2
      teams.sort! { |a, b| b[:P] <=> a[:P] }
      return display_table_results(teams)
    end
  end

  private

  def self.display_table_results(teams)
    "#{self.display_headers}#{self.display_teams_result(teams)}"
  end

  def self.display_headers
    "Team                           | MP |  W |  D |  L |  P\n"
  end

  def self.display_teams_result(teams_array)
    result = ""
    teams_array.each do |team|
    result += "#{team[:name]}             |  #{team[:MP]} |  #{team[:W]} |  #{team[:D]} |  #{team[:L]} |  #{team[:P]}\n"
    end
    result
  end
end
