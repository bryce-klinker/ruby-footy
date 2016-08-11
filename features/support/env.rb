require './src/shared/footy_config'
require 'rack/test'

test_config_path = File.expand_path './config.test.yml'
FootyConfig.load(test_config_path)

require './src/footy_app'
module KnowsFootyApp
  def app
    Sinatra::Application
  end
end

World(KnowsFootyApp, Rack::Test::Methods)