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
  clubNames = @clubs.map { |c| c.name }

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

Then(/^I should get each club's number of wins$/) do
  expectClubToHaveWins 'Leicester', 23
  expectClubToHaveWins 'Arsenal', 20
  expectClubToHaveWins 'Tottenham', 19
  expectClubToHaveWins 'Man City', 19
  expectClubToHaveWins 'Man United', 19
  expectClubToHaveWins 'Southampton', 18
  expectClubToHaveWins 'West Ham', 16
  expectClubToHaveWins 'Liverpool', 16
  expectClubToHaveWins 'Stoke', 14
  expectClubToHaveWins 'Chelsea', 12
  expectClubToHaveWins 'Everton', 11
  expectClubToHaveWins 'Swansea', 12
  expectClubToHaveWins 'Watford', 12
  expectClubToHaveWins 'West Brom', 10
  expectClubToHaveWins 'Crystal Palace', 11
  expectClubToHaveWins 'Bournemouth', 11
  expectClubToHaveWins 'Sunderland', 9
  expectClubToHaveWins 'Newcastle', 9
  expectClubToHaveWins 'Norwich', 9
  expectClubToHaveWins 'Aston Villa', 3
end

def expectClubToHaveWins(clubName, wins)
  club = @clubs.select{|c| c.name == clubName }.first
  expect(club.wins).to eql(wins)
end