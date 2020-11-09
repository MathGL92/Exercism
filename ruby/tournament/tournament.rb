=begin
Write your code for the 'Tournament' exercise in this file. Make the tests in
`tournament_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/tournament` directory.
=end
require_relative "team"
require_relative "score_board"
require "pry"

class Tournament

  def initialize(results)
    @results = results.split("\n").map { |game| game.split(';') }
    @teams = []
  end

  def process_results
    @results.each { |result| add_result_to_teams(result) }
    rank_teams(@teams)
    ScoreBoard.display_board(@teams)
  end

  def self.tally(results)
    Tournament.new(results).process_results
  end

  private

  def add_result_to_teams(result)
    team1 = get_team(result[0])
    team2 = get_team(result[1])
    if result[2] == "win"
      team1.wins_game
      team2.looses_game
    elsif result[2] == "loss"
      team1.looses_game
      team2.wins_game
    else
      team1.ties_game
      team2.ties_game
    end
  end

  def get_team(name)
    team = @teams.find { |team| team.name == name }

    team.nil? ? create_team(name) : team
  end

  def create_team(name)
    team = Team.new(name)
    @teams << team
    team
  end

  def rank_teams(teams)
    teams.sort_by! {|team| [-team.points, team.name] }
  end
end
