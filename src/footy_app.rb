require 'sinatra'
require_relative 'seasons/season_gateway'
require_relative 'shared/footy_config'

season_gateway = SeasonGateway.new FootyConfig.seasons_directory
get '/seasons/:start_year/:end_year/:league_name/clubs' do
  start_year = params['start_year']
  end_year = params['end_year']
  league_name = params['league_name']
  season = season_gateway.get_by_league_name(league_name)
    .select{ |s| s.start_year == start_year }
    .select{ |s| s.end_year == end_year }.first

  season.clubs
end
