class Club
  def name
    return @name
  end

  def wins
    return calculate_wins
  end

  def initialize(name, all_matches)
    @name = name
    @all_matches = all_matches
  end

  def calculate_wins
    home_wins = @all_matches.select{ |m| m.is_host name }
      .select{ |m| m.is_host_winner  }
      .length
    away_wins = @all_matches.select{ |m| m.is_visitor name }
      .select{ |m| m.is_visitor_winner }
      .length
    return home_wins + away_wins
  end
end