require './src/leagues/league_gateway'
require './src/shared/footy_config'

When(/^I get leagues$/) do
  league_gateway = LeagueGateway.new FootyConfig.seasons_directory
  @leagues = league_gateway.get_all
end

When(/^I get league (.*)$/) do |league_name|
  league_gateway = LeagueGateway.new FootyConfig.seasons_directory
  @league = league_gateway.get_by_name league_name
end

Then(/^I should get the league (.*)$/) do |league_name|
  league_names = @leagues.map{ |l| l.name }
  expect(league_names).to include league_name
end

Then(/^I should get (\d+)_(\d+) season$/) do |start_year, end_year|
  seasons = @league.seasons.select{ |s| s.start_year == start_year.to_i }
    .select{ |s| s.end_year == end_year.to_i }

  expect(seasons.length).to eql 1
end