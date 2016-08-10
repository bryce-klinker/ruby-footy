class Season
  def start_year
    @start_year
  end

  def end_year
    @end_year
  end

  def league_name
    @league_name
  end

  def clubs
    Array.new 20
  end

  def initialize(start_year, end_year, league_name)
    @start_year = start_year.to_i
    @end_year = end_year.to_i
    @league_name = league_name
  end
end