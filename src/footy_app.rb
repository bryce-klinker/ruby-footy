require 'sinatra'
require 'json'
require_relative 'seasons/season_gateway'
require_relative 'leagues/league_gateway'
require_relative 'shared/footy_config'

season_gateway = SeasonGateway.new FootyConfig.seasons_directory
league_gateway = LeagueGateway.new FootyConfig.seasons_directory
get '/seasons/:start_year/:end_year/:league_name/clubs' do
  content_type :json
  season = season_gateway.get_season(params['start_year'], params['end_year'], params['league_name'])
  season.clubs.map{ |c| c.to_json }.to_json
end

get '/leagues' do
  league_gateway.get_all.map{ |l| l.to_json }.to_json
end
