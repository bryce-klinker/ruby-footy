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
  expect_club_to_have_wins 'Leicester', 23
  expect_club_to_have_wins 'Arsenal', 20
  expect_club_to_have_wins 'Tottenham', 19
  expect_club_to_have_wins 'Man City', 19
  expect_club_to_have_wins 'Man United', 19
  expect_club_to_have_wins 'Southampton', 18
  expect_club_to_have_wins 'West Ham', 16
  expect_club_to_have_wins 'Liverpool', 16
  expect_club_to_have_wins 'Stoke', 14
  expect_club_to_have_wins 'Chelsea', 12
  expect_club_to_have_wins 'Everton', 11
  expect_club_to_have_wins 'Swansea', 12
  expect_club_to_have_wins 'Watford', 12
  expect_club_to_have_wins 'West Brom', 10
  expect_club_to_have_wins 'Crystal Palace', 11
  expect_club_to_have_wins 'Bournemouth', 11
  expect_club_to_have_wins 'Sunderland', 9
  expect_club_to_have_wins 'Newcastle', 9
  expect_club_to_have_wins 'Norwich', 9
  expect_club_to_have_wins 'Aston Villa', 3
end

Then(/^I should get each club's number of draws$/) do
  expect_club_to_have_draws 'Leicester', 12
  expect_club_to_have_draws 'Arsenal', 11
  expect_club_to_have_draws 'Tottenham', 13
  expect_club_to_have_draws 'Man City', 9
  expect_club_to_have_draws 'Man United', 9
  expect_club_to_have_draws 'Southampton', 9
  expect_club_to_have_draws 'West Ham', 14
  expect_club_to_have_draws 'Liverpool', 12
  expect_club_to_have_draws 'Stoke', 9
  expect_club_to_have_draws 'Chelsea', 14
  expect_club_to_have_draws 'Everton', 14
  expect_club_to_have_draws 'Swansea', 11
  expect_club_to_have_draws 'Watford', 9
  expect_club_to_have_draws 'West Brom', 13
  expect_club_to_have_draws 'Crystal Palace', 9
  expect_club_to_have_draws 'Bournemouth', 9
  expect_club_to_have_draws 'Sunderland', 12
  expect_club_to_have_draws 'Newcastle', 10
  expect_club_to_have_draws 'Norwich', 7
  expect_club_to_have_draws 'Aston Villa', 8
end

Then(/^I should get each club's number of losses$/) do
  expect_club_to_have_losses 'Leicester', 3
  expect_club_to_have_losses 'Arsenal', 7
  expect_club_to_have_losses 'Tottenham', 6
  expect_club_to_have_losses 'Man City', 10
  expect_club_to_have_losses 'Man United', 10
  expect_club_to_have_losses 'Southampton', 11
  expect_club_to_have_losses 'West Ham', 8
  expect_club_to_have_losses 'Liverpool', 10
  expect_club_to_have_losses 'Stoke', 15
  expect_club_to_have_losses 'Chelsea', 12
  expect_club_to_have_losses 'Everton', 13
  expect_club_to_have_losses 'Swansea', 15
  expect_club_to_have_losses 'Watford', 17
  expect_club_to_have_losses 'West Brom', 15
  expect_club_to_have_losses 'Crystal Palace', 18
  expect_club_to_have_losses 'Bournemouth', 18
  expect_club_to_have_losses 'Sunderland', 17
  expect_club_to_have_losses 'Newcastle', 19
  expect_club_to_have_losses 'Norwich', 22
  expect_club_to_have_losses 'Aston Villa', 27
end

Then(/^I should get each club's point total$/) do
  expect_club_to_have_points 'Leicester', 81
  expect_club_to_have_points 'Arsenal', 71
  expect_club_to_have_points 'Tottenham', 70
  expect_club_to_have_points 'Man City', 66
  expect_club_to_have_points 'Man United', 66
  expect_club_to_have_points 'Southampton', 63
  expect_club_to_have_points 'West Ham', 62
  expect_club_to_have_points 'Liverpool', 60
  expect_club_to_have_points 'Stoke', 51
  expect_club_to_have_points 'Chelsea', 50
  expect_club_to_have_points 'Everton', 47
  expect_club_to_have_points 'Swansea', 47
  expect_club_to_have_points 'Watford', 45
  expect_club_to_have_points 'West Brom', 43
  expect_club_to_have_points 'Crystal Palace', 42
  expect_club_to_have_points 'Bournemouth', 42
  expect_club_to_have_points 'Sunderland', 39
  expect_club_to_have_points 'Newcastle', 37
  expect_club_to_have_points 'Norwich', 34
  expect_club_to_have_points 'Aston Villa', 17
end

def get_club_by_name(club_name)
  @clubs.select { |c| c.name == club_name }.first
end

def expect_club_to_have_wins(club_name, wins)
  club = get_club_by_name club_name
  expect(club.wins).to eql wins
end

def expect_club_to_have_draws(club_name, draws)
  club = get_club_by_name club_name
  expect(club.draws).to eql draws
end

def expect_club_to_have_losses(club_name, losses)
  club = get_club_by_name club_name
  expect(club.losses).to eql losses
end

def expect_club_to_have_points(club_name, points)
  club = get_club_by_name club_name
  expect(club.points).to eql points
end