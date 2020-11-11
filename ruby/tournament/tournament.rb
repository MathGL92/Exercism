require_relative 'team'
require_relative 'score_board'
require_relative 'game'
require 'pry'

class Tournament
  def initialize(input)
    @teams = []
    @games = parse_games(input)
    @score_board = ScoreBoard.new(@teams)
  end

  def process_games
    # add games to to teams
    @games.each { |game| add_result_to_teams_stats(game) }
    # rank teams
    rank_teams(@teams)
    # display games in the ScoreBoard
    @score_board.display_final_board
  end

  def self.tally(input)
    Tournament.new(input).process_games
  end

  private

  def parse_games(input)
    input.split("\n").map do |game|
      (*team_names, result) = game.split(';')
      game_teams = team_names.map { |name| parse_team(name) }
      Game.new(*game_teams, result)
    end
  end

  def add_result_to_teams_stats(game)
    case game.result
    when 'win' then game.team_one.wins_game && game.team_two.looses_game
    when 'loss' then game.team_one.looses_game && game.team_two.wins_game
    else game.team_one.ties_game && game.team_two.ties_game
    end
  end

  def parse_team(name)
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
