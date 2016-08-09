class Match
  def host
    @match_values[2]
  end

  def visitor
    @match_values[3]
  end

  def referee_name
    @match_values[10]
  end

  def host_score
    @match_values[4].to_i
  end

  def visitor_score
    @match_values[5].to_i
  end

  def initialize(match_line)
    @match_values = match_line.split(',')
  end

  def is_host(club_name)
    host == club_name
  end

  def is_visitor(club_name)
    visitor == club_name
  end

  def is_winner(club_name)
    if is_host club_name
      return host_score > visitor_score
    end

    if is_visitor club_name
      return visitor_score > host_score
    end

    false
  end

  def is_draw(club_name)
    if is_host club_name or is_visitor club_name
      return host_score == visitor_score
    end

    false
  end

  def is_loser(club_name)
    if is_host club_name
      return host_score < visitor_score
    end

    if is_visitor club_name
      return visitor_score < host_score
    end

    false
  end

  def allowed(club_name)
    if is_host club_name
      return visitor_score
    end

    if is_visitor club_name
      return host_score
    end

    0
  end

  def scored(club_name)
    if is_host club_name
      return host_score
    end

    if is_visitor club_name
      return visitor_score
    end

    0
  end
end