require_relative '../clubs/club_gateway'
require_relative '../referees/referee_gateway'

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
    @club_gateway.get_all
  end

  def leader_board
    clubs.sort_by{ |c| c.points }.reverse
  end

  def referees
    @referee_gateway.get_all
  end

  def csv_path
    File.expand_path "../../../data/seasons/#{start_year}_#{end_year}_#{league_name.gsub ' ', '_'}.csv", __FILE__
  end

  def initialize(start_year, end_year, league_name)
    @start_year = start_year.to_i
    @end_year = end_year.to_i
    @league_name = league_name
    @club_gateway = ClubGateway.new csv_path
    @referee_gateway = RefereeGateway.new csv_path
  end
end