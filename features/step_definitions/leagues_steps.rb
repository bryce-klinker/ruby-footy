require './src/leagues/league_gateway'
require './src/shared/footy_config'
require 'json'

When(/^I get leagues$/) do
  get '/leagues'
  @leagues = get_response_as_hash
end

When(/^I get league (.*)$/) do |league_name|
  get "/leagues/#{league_name.gsub(' ', '_')}"
  @league = get_response_as_hash
end

Then(/^I should get the league (.*)$/) do |league_name|
  league_names = @leagues.map{ |l| l['name'] }
  expect(league_names).to include league_name
end

Then(/^I should get (\d+)_(\d+) season$/) do |start_year, end_year|
  seasons = @league['seasons'].select{ |s| s['start_year'] == start_year.to_i }
    .select{ |s| s['end_year'] == end_year.to_i }

  expect(seasons.length).to eql 1
end