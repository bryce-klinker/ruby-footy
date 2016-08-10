require './src/leagues/league_gateway'
require './src/shared/footy_config'

When(/^I get leagues$/) do
  seasons_path = FootyConfig.seasons_directory
  league_gateway = LeagueGateway.new seasons_path
  @leagues = league_gateway.get_all
end


Then(/^I should get the league (.*)$/) do |league_name|
  league_names = @leagues.map{ |l| l.name }
  expect(league_names).to include league_name
end