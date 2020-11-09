class ScoreBoard
  def self.display_board(teams)
    "#{self.display_headers}#{self.display_teams_result(teams)}"
  end

  def self.display_headers
    "Team                           | MP |  W |  D |  L |  P\n"
  end

  def self.display_teams_result(teams)
    result = ""
    teams.each do |team|
    result += "#{team.name.ljust(31, " ")}|  #{team.match_played} |  #{team.won} |  #{team.drawn} |  #{team.lost} |  #{team.points}\n"
    end
    result
  end
end
