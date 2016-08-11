ENV['SEASONS_DIRECTORY'] = File.expand_path './test_data/seasons'

require 'rack/test'
require './src/footy_app'

module KnowsFootyApp
  def app
    Sinatra::Application
  end
end

World(KnowsFootyApp, Rack::Test::Methods)