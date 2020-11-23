class Tournament
  def initialize(games)
    @teams = []
    @games = parse_games(games)
    @score_board = ScoreBoard.new(@teams)
  end

  def self.tally(game)
    Tournament.new(game).process_games
  end

  def process_games
    # add games to teams stats
    @games.each { |game| add_result_to_teams_stats(game) }
    # rank teams
    rank_teams(@teams)
    # display games in the ScoreBoard
    @score_board.display_final_board
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

  def rank_teams(teams)
    teams.sort_by! { |team| [-team.points, team.name] }
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
end

class ScoreBoard
  def initialize(teams)
    @teams = teams
  end

  def display_final_board
    display_headers + display_teams_result
  end

  private

  def display_headers
    display_line('Team', 'MP', 'W', 'D', 'L', 'P')
  end

  def display_teams_result
    @teams
      .map { |team| display_line(team.name, team.match_played, team.won, team.drawn, team.lost, team.points) }
      .join
  end

  def display_line(*args)
    format("%-31s| %2s | %2s | %2s | %2s | %2s\n", *args)
  end
end

class Team
  attr_reader :name
  attr_accessor :match_played, :won, :drawn, :lost, :points

  def initialize(name)
    @name = name
    @match_played = 0
    @won = 0
    @drawn = 0
    @lost = 0
    @points = 0
  end

  def wins_game
    @match_played += 1
    @won += 1
    @points += 3
  end

  def looses_game
    @match_played += 1
    @lost += 1
    @points += 0
  end

  def ties_game
    @match_played += 1
    @drawn += 1
    @points += 1
  end
end

class Game
  attr_reader :team_one, :team_two, :result

  def initialize(team_one, team_two, result)
    @team_one = team_one
    @team_two = team_two
    @result = result
  end
end
