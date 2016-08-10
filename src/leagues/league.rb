require_relative '../seasons/season_gateway'

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
end