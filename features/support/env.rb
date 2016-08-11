require './src/shared/footy_config'
require './src/footy_app'
require 'rack/test'

test_config_path = File.expand_path './config.test.yml'
FootyConfig.load(test_config_path)

module KnowsFootyApp
  def app
    Footy.new
  end
end

World(KnowsFootyApp, Rack::Test::Methods)