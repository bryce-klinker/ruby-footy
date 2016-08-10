require './src/seasons/season'

When(/^I get season (\d+)_(\d+) (.*) season$/) do |start_year, end_year, season_name|
  @season = Season.new(start_year, end_year, season_name)
end

Then(/^I should get all (\d+) clubs in (\d+)_(\d+) (.*) season$/) do |number_of_clubs, start_year, end_year, season_name|
  expect(@season.start_year).to eql start_year
  expect(@season.end_year).to eql end_year
  expect(@season.name).to eql season_name
  expect(@season.clubs.length).to eql number_of_clubs
end