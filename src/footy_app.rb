require 'sinatra'
require 'multi_json'
require_relative 'seasons/season_gateway'
require_relative 'shared/footy_config'

season_gateway = SeasonGateway.new FootyConfig.seasons_directory
get '/seasons/:start_year/:end_year/:league_name/clubs' do
  content_type :json
  start_year = params['start_year']
  end_year = params['end_year']
  league_name = params['league_name']
  season = season_gateway.get_season(start_year, end_year, league_name)

end
