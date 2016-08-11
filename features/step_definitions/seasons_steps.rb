require './src/seasons/season'
require './src/seasons/season_gateway'
require './src/shared/footy_config'

When(/^I get season (\d+)_(\d+) (.*) season with all related data$/) do |start_year, end_year, league_name|
  get "/leagues/#{league_name.gsub(' ', '_')}/seasons/#{start_year}/#{end_year}"
  @season = get_response_as_hash
end

When(/^I get (.*) seasons$/) do |league_name|
  get "/leagues/#{league_name.gsub(' ', '_')}/seasons"
  @league_seasons = get_response_as_hash
end

Then(/^I should get all 20 clubs in 2015_2016 Premier League season$/) do
  expect(@season.start_year).to eql 2015
  expect(@season.end_year).to eql 2016
  expect(@season.league_name).to eql 'Premier League'
  expect(@season.clubs.length).to eql 20
end

Then(/^I should have leader board for 2015_2016 Premier League season$/) do
  expect(@season.leader_board[0].name).to eql 'Leicester'
  expect(@season.leader_board[1].name).to eql 'Arsenal'
  expect(@season.leader_board[2].name).to eql 'Tottenham'
  expect(@season.leader_board[3].name).to eql 'Man City'
  expect(@season.leader_board[4].name).to eql 'Man United'
  expect(@season.leader_board[5].name).to eql 'Southampton'
  expect(@season.leader_board[6].name).to eql 'West Ham'
  expect(@season.leader_board[7].name).to eql 'Liverpool'
  expect(@season.leader_board[8].name).to eql 'Stoke'
  expect(@season.leader_board[9].name).to eql 'Chelsea'
  expect(@season.leader_board[10].name).to eql 'Everton'
  expect(@season.leader_board[11].name).to eql 'Swansea'
  expect(@season.leader_board[12].name).to eql 'Watford'
  expect(@season.leader_board[13].name).to eql 'West Brom'
  expect(@season.leader_board[14].name).to eql 'Crystal Palace'
  expect(@season.leader_board[15].name).to eql 'Bournemouth'
  expect(@season.leader_board[16].name).to eql 'Sunderland'
  expect(@season.leader_board[17].name).to eql 'Newcastle'
  expect(@season.leader_board[18].name).to eql 'Norwich'
  expect(@season.leader_board[19].name).to eql 'Aston Villa'
end

Then(/^I should get all referees in 2015_2016 Premier League season$/) do
  expect(@season.referees.length).to eql 19
end

Then(/^I should get all 380 matches in 2015_2016 Premier League season$/) do
  expect(@season.matches.length).to eql 380
end

Then(/^I should get (\d+)_(\d+) (.*) season$/) do |start_year, end_year, league_name|
  seasons = @league_seasons.select{ |s| s.start_year == start_year.to_i }
    .select{ |s| s.end_year == end_year.to_i }
    .select{ |s| s.league_name == league_name }

  expect(seasons.length).to eql 1
end