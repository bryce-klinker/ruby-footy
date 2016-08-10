require './src/leagues/league_gateway'

When(/^I get leagues$/) do
  seasons_path = File.expand_path './data/seasons'
  league_gateway = LeagueGateway.new seasons_path
  @leagues = league_gateway.get_all
end


Then(/^I should get league (.*)$/) do |league_name|
  league_names = @leagues.map{ |l| l.name }
  expect(league_names).to include league_name
end