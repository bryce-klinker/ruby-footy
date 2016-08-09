require '../../src/teams/team_gateway.rb'

Given(/^2015\/2016 Premier League data$/) do
  @csvPath = File.expand_path '../../data/csv/2015_2016_Premier_League_Results.csv', __FILE__
end

When(/^I get all teams$/) do
  teamParser = TeamGateway.new @csvPath
  @teams = teamParser.getTeams
end

Then(/^I should get Premier League teams for the 2015\/2016 season$/) do
  expect(@teams.size).to equal(20)
end