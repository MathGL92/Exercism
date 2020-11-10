class ScoreBoard
  def self.display_final_board(teams)
    self.display_headers + self.display_teams_result(teams)
  end

  def self.display_headers
    display_line("Team", "MP",  "W", "D", "L", "P")
  end

  def self.display_teams_result(teams)
    teams
      .map { |team| display_line(team.name, team.match_played, team.won,  team.drawn, team.lost, team.points) }
      .join
  end

  private

  def self.display_line(*args)
    format("%-31s| %2s | %2s | %2s | %2s | %2s\n", *args)
  end
end
