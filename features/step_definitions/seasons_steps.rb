require './src/seasons/season'

When(/^I get season (\d+)_(\d+) (.*) season$/) do |start_year, end_year, league_name|
  @season = Season.new(start_year, end_year, league_name)
end

Then(/^I should get all 20 clubs in 2015_2016 Premier League season$/) do
  expect(@season.start_year).to eql 2015
  expect(@season.end_year).to eql 2016
  expect(@season.league_name).to eql 'Premier League'
  expect(@season.clubs.length).to eql 20
end

Then(/^I should have leader board for 2015_2016 Premier League season$/) do
  expect(@season.leader_board[0].name).to eql 'Leicester City'
end