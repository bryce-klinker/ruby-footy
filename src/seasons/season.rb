require_relative '../clubs/club_gateway'
require_relative '../referees/referee_gateway'
require_relative '../matches/match_gateway'

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

  def matches
    @match_gateway.get_all
  end

  def csv_path
    @csv_path
  end

  def initialize(csv_path)
    @csv_path = csv_path
    extension = File.extname @csv_path
    file_name = File.basename @csv_path, extension
    parts = file_name.split('_')

    @start_year = parts[0].to_i
    @end_year = parts[1].to_i
    @league_name = parts.drop(2).join(' ')

    @club_gateway = ClubGateway.new @csv_path
    @referee_gateway = RefereeGateway.new @csv_path
    @match_gateway = MatchGateway.new @csv_path
  end
end