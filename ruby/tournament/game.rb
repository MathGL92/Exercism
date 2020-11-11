class Game
  attr_reader :team_one, :team_two, :result

  def initialize(team_one, team_two, result)
    @team_one = team_one
    @team_two = team_two
    @result = result
  end
end
