require './src/clubs/club_gateway'

Given(/^2015\/2016 Premier League data$/) do
  @csvPath = File.expand_path '../../../data/csv/2015_2016_Premier_League_Results.csv', __FILE__
end

When(/^I get all clubs$/) do
  clubGateway = ClubGateway.new @csvPath
  @clubs = clubGateway.getAll
end

Then(/^I should get Premier League clubs for the 2015\/2016 season$/) do
  expect(@clubs.size).to eq 20
end

Then(/^I should get each club's name$/) do
  puts @clubs
  clubNames = @clubs.map { |c| c[:name] }

  expect(clubNames).to include 'Arsenal'
  expect(clubNames).to include 'Aston Villa'
  expect(clubNames).to include 'Bournemouth'
  expect(clubNames).to include 'Chelsea'
  expect(clubNames).to include 'Everton'
  expect(clubNames).to include 'Crystal Palace'
  expect(clubNames).to include 'Man United'
  expect(clubNames).to include 'Swansea'
  expect(clubNames).to include 'Watford'
  expect(clubNames).to include 'Leicester'
  expect(clubNames).to include 'Sunderland'
  expect(clubNames).to include 'Tottenham'
  expect(clubNames).to include 'West Ham'
  expect(clubNames).to include 'Newcastle'
  expect(clubNames).to include 'West Brom'
  expect(clubNames).to include 'Man City'
  expect(clubNames).to include 'Southampton'
  expect(clubNames).to include 'Liverpool'
  expect(clubNames).to include 'Norwich'
  expect(clubNames).to include 'Stoke'
end