class Match
  def host_name
    return @match_values[2]
  end

  def visitor_name
    return @match_values[3]
  end

  def host_score
    return @match_values[4]
  end

  def visitor_score
    return @match_values[5]
  end

  def is_visitor_winner
    return visitor_score > host_score
  end

  def is_host_winner
    return host_score > visitor_score
  end

  def initialize(match_line)
    @match_values = match_line.split(',')
  end

  def is_host(clubName)
    return host_name == clubName
  end

  def is_visitor(clubName)
    return visitor_name == clubName
  end
end