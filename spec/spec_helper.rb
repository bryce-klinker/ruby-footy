ENV['SEASONS_DIRECTORY'] = File.expand_path './test_data/seasons'

require 'rack/test'
require 'sinatra'
require './src/footy_app'

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

def app
  Sinatra::Application
end

def get_season_csv_path(start_year, end_year, league_name)
  file_name = "#{start_year}_#{end_year}_#{league_name.gsub(' ', '_')}.csv"
  File.expand_path "#{ENV['SEASONS_DIRECTORY']}/#{file_name}", __FILE__
end