require './src/clubs/club_gateway'

Given(/^2015\/2016 Premier League data$/) do
  @csvPath = File.expand_path '../../data/csv/2015_2016_Premier_League_Results.csv', __FILE__
end

When(/^I get all clubs$/) do
  clubGateway = ClubGateway.new @csvPath
  @clubs = clubGateway.getAll
end

Then(/^I should get Premier League clubs for the 2015\/2016 season$/) do
  expect(@clubs.size).to equal(20)
end

Then(/^I should get each club's name$/) do
  clubNames = @clubs.collect { |c| c.name }
  expect(clubNames).to include('Arsenal')
end