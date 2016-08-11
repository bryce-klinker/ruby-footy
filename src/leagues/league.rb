require_relative '../seasons/season_gateway'
require 'json'

class League
  def name
    @league_name
  end

  def seasons
    @season_gateway.get_by_league_name name
  end

  def initialize(league_name, seasons_directory)
    @league_name = league_name
    @season_gateway = SeasonGateway.new seasons_directory
  end

  def get_season(start_year, end_year)
    seasons.select{ |s| s.start_year == start_year.to_i }
      .select{ |s| s.end_year == end_year.to_i }
      .first
  end

  def to_json(*args)
    {
        :name => name,
        :seasons => seasons
    }.to_json(*args)
  end
end