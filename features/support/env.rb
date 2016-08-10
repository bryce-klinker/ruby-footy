require './src/shared/footy_config'

test_config_path = File.expand_path './config.test.yml'
FootyConfig.load(test_config_path)


ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'src/footy_app.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = Footy

class FootyWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  FootyWorld.new
end
