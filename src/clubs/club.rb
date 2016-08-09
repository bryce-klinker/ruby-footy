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
    wins * 3 + draws
  end

  def goals_against
    allowed = 0
    @all_matches.map{ |m| m.allowed name }
      .each{ |a| allowed += a }
    allowed
  end

  def initialize(name, all_matches)
    @name = name
    @all_matches = all_matches
  end
end