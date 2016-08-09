class Club
  def name
    return @name
  end

  def wins
    return calculate_wins
  end

  def initialize(name, allLines)
    @name = name
    @allLines = allLines
  end

  def calculate_wins
    home_wins = @allLines.select{ |l| is_home_team l }
      .select{ |l| is_home_team_winner l }
      .length
    away_wins = @allLines.select{ |l| is_away_team l }
      .select{ |l| is_away_team_winner l }
      .length
    return home_wins + away_wins
  end

  def is_home_team(match)
    return match.split(',')[2] == @name
  end

  def is_away_team(match)
    return match.split(',')[3] == @name
  end

  def is_home_team_winner(match)
    homeTeamScore = match.split(',')[4]
    awayTeamScore = match.split(',')[5]
    return homeTeamScore > awayTeamScore
  end

  def is_away_team_winner(match)
    homeTeamScore = match.split(',')[4]
    awayTeamScore = match.split(',')[5]
    return awayTeamScore > homeTeamScore
  end
end