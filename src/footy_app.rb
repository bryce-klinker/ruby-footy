require 'sinatra'
require 'json'
require_relative 'seasons/season_gateway'
require_relative 'leagues/league_gateway'
require_relative 'referees/referee_gateway'
require_relative 'shared/footy_config'

season_gateway = SeasonGateway.new FootyConfig.seasons_directory
league_gateway = LeagueGateway.new FootyConfig.seasons_directory

get '/leagues' do
  content_type :json
  league_gateway.get_all.to_json
end

get '/leagues/:league_name' do
  content_type :json
  league_gateway.get_by_name(params['league_name']).to_json
end

get '/leagues/:league_name/seasons/:start_year/:end_year/clubs' do
  content_type :json
  season = season_gateway.get_season(params['start_year'], params['end_year'], params['league_name'])
  season.clubs.to_json
end

get '/leagues/:league_name/seasons/:start_year/:end_year/referees' do
  content_type :json
  season = season_gateway.get_season(params['start_year'], params['end_year'], params['league_name'])
  season.referees.to_json
end
