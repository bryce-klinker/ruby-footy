class Club
  def name
    @name
  end

  def wins
    @all_matches.select{ |m| m.is_winner name }
          .length
  end

  def draws
    @all_matches.select{ |m| m.is_draw name }
          .length
  end

  def losses
    @all_matches.select{ |m| m.is_loser name }
        .length
  end

  def points
    return wins * 3 + draws
  end

  def initialize(name, all_matches)
    @name = name
    @all_matches = all_matches
  end
end