class Club
  def name
    return @name
  end

  def wins
    return @all_matches.select{ |m| m.is_winner name }
      .length
  end

  def draws
    return @all_matches.select{ |m| m.is_draw name }
      .length
  end

  def initialize(name, all_matches)
    @name = name
    @all_matches = all_matches
  end
end