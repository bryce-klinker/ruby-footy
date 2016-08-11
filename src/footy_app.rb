require 'sinatra'
require 'json'
require_relative 'leagues/league_gateway'
require_relative 'shared/footy_config'

league_gateway = LeagueGateway.new FootyConfig.seasons_directory

get '/leagues' do
  content_type :json
  league_gateway.get_all.to_json
end

get '/leagues/:league_name' do
  content_type :json
  league_gateway.get_by_name(params['league_name']).to_json
end

get '/leagues/:league_name/seasons' do
  content_type :json
  league_gateway.get_by_name(params['league_name']).seasons.to_json
end

get '/leagues/:league_name/seasons/:start_year/:end_year' do
  content_type :json
  league = league_gateway.get_by_name params['league_name']

  season = league.get_season params['start_year'], params['end_year']
  season.to_json(params['include'])
end

get '/leagues/:league_name/seasons/:start_year/:end_year/clubs' do
  content_type :json
  league = league_gateway.get_by_name params['league_name']

  season = league.get_season params['start_year'], params['end_year']
  season.clubs.to_json
end

get '/leagues/:league_name/seasons/:start_year/:end_year/referees' do
  content_type :json
  league = league_gateway.get_by_name params['league_name']

  season = league.get_season params['start_year'], params['end_year']
  season.referees.to_json
end
