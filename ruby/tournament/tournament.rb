require_relative 'team'
require_relative 'score_board'
require 'pry'

class Tournament
  def initialize(results)
    @results = results.split("\n").map { |result| result.split(';') }
    @teams = []
    @score_board = ScoreBoard.new(@teams)
  end

  def process_results
    # add results to to teams
    @results.each { |result| add_result_to_teams(result) }
    # rank teams
    rank_teams(@teams)
    # display results in the ScoreBoard
    @score_board.display_final_board
  end

  def self.tally(results)
    Tournament.new(results).process_results
  end

  private

  def add_result_to_teams(result)
    team1 = get_or_create_team(result[0])
    team2 = get_or_create_team(result[1])
    case result[2]
    when 'win' then team1.wins_game && team2.looses_game
    when 'loss' then team1.looses_game && team2.wins_game
    else
      team1.ties_game
      team2.ties_game
    end
  end

  def get_or_create_team(name)
    team_found = @teams.find { |team| team.name == name }

    team_found.nil? ? create_team(name) : team_found
  end

  def create_team(name)
    new_team = Team.new(name)
    @teams << new_team
    new_team
  end

  def rank_teams(teams)
    teams.sort_by! { |team| [-team.points, team.name] }
  end
end
