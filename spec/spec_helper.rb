require 'rack/test'
require 'sinatra'
require './src/footy_app'
require './src/shared/footy_config'

test_config_path = File.expand_path './config.test.yml'
FootyConfig.load(test_config_path)

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

def app
  Sinatra::Application
end

def get_season_csv_path(start_year, end_year, league_name)
  file_name = "#{start_year}_#{end_year}_#{league_name.gsub(' ', '_')}.csv"
  File.expand_path "#{FootyConfig.seasons_directory}/#{file_name}", __FILE__
end