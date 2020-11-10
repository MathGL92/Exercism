class ScoreBoard
  attr_accessor :teams

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
