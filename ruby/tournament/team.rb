class Team
  attr_accessor :match_played, :won, :drawn, :lost, :points
  attr_reader :name

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
