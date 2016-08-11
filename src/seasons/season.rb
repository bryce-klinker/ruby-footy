require_relative '../clubs/club_gateway'
require_relative '../referees/referee_gateway'
require_relative '../matches/match_gateway'
require_relative '../shared/csv_path_helper'
require 'json'

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

  def initialize(csv_path)
    @end_year = get_end_year_from_csv_path csv_path
    @start_year = get_start_year_from_csv_path csv_path
    @league_name = get_league_name_from_csv_path csv_path

    @club_gateway = ClubGateway.new csv_path
    @referee_gateway = RefereeGateway.new csv_path
    @match_gateway = MatchGateway.new csv_path
  end

  def to_json(*args)
    {
        :start_year => start_year,
        :end_year => end_year,
        :league_name => league_name,
        :clubs => clubs,
        :leader_board => leader_board,
        :referees => referees
    }.to_json(*args)
  end
end