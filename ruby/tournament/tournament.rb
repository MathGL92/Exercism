require_relative 'team'
require_relative 'score_board'
require_relative 'game'
require 'pry'

class Tournament
  def initialize(input)
    @games = parse_games(input)
    @teams = []
    @score_board = ScoreBoard.new(@teams)
  end

  def process_games
    # add games to to teams
    @games.each { |game| parse_teams_from_game(game) }
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
    games = input.split("\n").map do |game|
      (*team_names, result) = game.split(';')
      Game.new(*team_names, result)
    end
  end

  def parse_teams_from_game(game)
    team1 = get_or_create_team(game.team_one)
    team2 = get_or_create_team(game.team_two)
    case game.result
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
