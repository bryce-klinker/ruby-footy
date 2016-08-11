require './src/seasons/season'
require './src/shared/footy_config'
require 'json'

When(/^I get all clubs for (\d+)_(\d+) (.*) season$/) do |start_year, end_year, league_name|
  get "/leagues/#{league_name.gsub(' ', '_')}/seasons/#{start_year}/#{end_year}/clubs"
  @clubs = get_response_as_hash
end

Then(/^I should get Premier League clubs for the 2015_2016 season$/) do
  expect(last_response.status).to eql 200
  expect(@clubs.size).to eq 20
end

Then(/^I should get each club's name$/) do
  club_names = @clubs.map { |c| c['name'] }

  expect(club_names).to include 'Arsenal'
  expect(club_names).to include 'Aston Villa'
  expect(club_names).to include 'Bournemouth'
  expect(club_names).to include 'Chelsea'
  expect(club_names).to include 'Everton'
  expect(club_names).to include 'Crystal Palace'
  expect(club_names).to include 'Man United'
  expect(club_names).to include 'Swansea'
  expect(club_names).to include 'Watford'
  expect(club_names).to include 'Leicester'
  expect(club_names).to include 'Sunderland'
  expect(club_names).to include 'Tottenham'
  expect(club_names).to include 'West Ham'
  expect(club_names).to include 'Newcastle'
  expect(club_names).to include 'West Brom'
  expect(club_names).to include 'Man City'
  expect(club_names).to include 'Southampton'
  expect(club_names).to include 'Liverpool'
  expect(club_names).to include 'Norwich'
  expect(club_names).to include 'Stoke'
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

Then(/^I should get each club's goals allowed count$/) do
  expect_club_to_have_goals_allowed 'Leicester', 36
  expect_club_to_have_goals_allowed 'Arsenal', 36
  expect_club_to_have_goals_allowed 'Tottenham', 35
  expect_club_to_have_goals_allowed 'Man City', 41
  expect_club_to_have_goals_allowed 'Man United', 35
  expect_club_to_have_goals_allowed 'Southampton', 41
  expect_club_to_have_goals_allowed 'West Ham', 51
  expect_club_to_have_goals_allowed 'Liverpool', 50
  expect_club_to_have_goals_allowed 'Stoke', 55
  expect_club_to_have_goals_allowed 'Chelsea', 53
  expect_club_to_have_goals_allowed 'Everton', 55
  expect_club_to_have_goals_allowed 'Swansea', 52
  expect_club_to_have_goals_allowed 'Watford', 50
  expect_club_to_have_goals_allowed 'West Brom', 48
  expect_club_to_have_goals_allowed 'Crystal Palace', 51
  expect_club_to_have_goals_allowed 'Bournemouth', 67
  expect_club_to_have_goals_allowed 'Sunderland', 62
  expect_club_to_have_goals_allowed 'Newcastle', 65
  expect_club_to_have_goals_allowed 'Norwich', 67
  expect_club_to_have_goals_allowed 'Aston Villa', 76
end

Then(/^I should get each club's goals scored count$/) do
  expect_club_to_have_goals_scored 'Leicester', 68
  expect_club_to_have_goals_scored 'Arsenal', 65
  expect_club_to_have_goals_scored 'Tottenham', 69
  expect_club_to_have_goals_scored 'Man City', 71
  expect_club_to_have_goals_scored 'Man United', 49
  expect_club_to_have_goals_scored 'Southampton', 59
  expect_club_to_have_goals_scored 'West Ham', 65
  expect_club_to_have_goals_scored 'Liverpool', 63
  expect_club_to_have_goals_scored 'Stoke', 41
  expect_club_to_have_goals_scored 'Chelsea', 59
  expect_club_to_have_goals_scored 'Everton', 59
  expect_club_to_have_goals_scored 'Swansea', 42
  expect_club_to_have_goals_scored 'Watford', 40
  expect_club_to_have_goals_scored 'West Brom', 34
  expect_club_to_have_goals_scored 'Crystal Palace', 39
  expect_club_to_have_goals_scored 'Bournemouth', 45
  expect_club_to_have_goals_scored 'Sunderland', 48
  expect_club_to_have_goals_scored 'Newcastle', 44
  expect_club_to_have_goals_scored 'Norwich', 39
  expect_club_to_have_goals_scored 'Aston Villa', 27
end

Then(/^I should get each club's goal differential$/) do
  expect_club_to_have_goal_differential 'Leicester', 32
  expect_club_to_have_goal_differential 'Arsenal', 29
  expect_club_to_have_goal_differential 'Tottenham', 34
  expect_club_to_have_goal_differential 'Man City', 30
  expect_club_to_have_goal_differential 'Man United', 14
  expect_club_to_have_goal_differential 'Southampton', 18
  expect_club_to_have_goal_differential 'West Ham', 14
  expect_club_to_have_goal_differential 'Liverpool', 13
  expect_club_to_have_goal_differential 'Stoke', -14
  expect_club_to_have_goal_differential 'Chelsea', 6
  expect_club_to_have_goal_differential 'Everton', 4
  expect_club_to_have_goal_differential 'Swansea', -10
  expect_club_to_have_goal_differential 'Watford', -10
  expect_club_to_have_goal_differential 'West Brom', -14
  expect_club_to_have_goal_differential 'Crystal Palace', -12
  expect_club_to_have_goal_differential 'Bournemouth', -22
  expect_club_to_have_goal_differential 'Sunderland', -14
  expect_club_to_have_goal_differential 'Newcastle', -21
  expect_club_to_have_goal_differential 'Norwich', -28
  expect_club_to_have_goal_differential 'Aston Villa', -49
end

def get_club_by_name(club_name)
  @clubs.select { |c| c['name'] == club_name }.first
end

def expect_club_to_have_wins(club_name, wins)
  club = get_club_by_name club_name
  expect(club['wins']).to eql wins
end

def expect_club_to_have_draws(club_name, draws)
  club = get_club_by_name club_name
  expect(club['draws']).to eql draws
end

def expect_club_to_have_losses(club_name, losses)
  club = get_club_by_name club_name
  expect(club['losses']).to eql losses
end

def expect_club_to_have_points(club_name, points)
  club = get_club_by_name club_name
  expect(club['points']).to eql points
end

def expect_club_to_have_goals_allowed(club_name, goals_allowed)
  club = get_club_by_name club_name
  expect(club['goals_allowed']).to eql goals_allowed
end

def expect_club_to_have_goals_scored(club_name, goals_scored)
  club = get_club_by_name club_name
  expect(club['goals_scored']).to eql goals_scored
end

def expect_club_to_have_goal_differential(club_name, goal_differential)
  club = get_club_by_name club_name
  expect(club['goal_differential']).to eql goal_differential
end