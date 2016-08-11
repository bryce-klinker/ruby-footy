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

  def to_json
    {
        :name => name
    }.to_json
  end
end