class Match
  def host_name
    @match_values[2]
  end

  def visitor_name
    @match_values[3]
  end

  def host_score
    @match_values[4]
  end

  def visitor_score
    @match_values[5]
  end

  def is_visitor_winner
    visitor_score > host_score
  end

  def is_host_winner
    host_score > visitor_score
  end

  def initialize(match_line)
    @match_values = match_line.split(',')
  end

  def is_host(club_name)
    host_name == club_name
  end

  def is_visitor(club_name)
    visitor_name == club_name
  end

  def is_winner(club_name)
    if is_host club_name
      return is_host_winner
    end

    if is_visitor club_name
      return is_visitor_winner
    end

    false
  end

  def is_draw(club_name)
    if is_host club_name or is_visitor club_name
      return host_score == visitor_score
    end

    false
  end
end