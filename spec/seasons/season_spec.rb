require './src/seasons/season'
require './src/shared/footy_config'
require 'json'

describe 'Season' do
  before do
    season_csv_path = get_season_csv_path 2015, 2016, 'Premier League'
    @season = Season.new season_csv_path
  end

  it 'should have start year' do
    expect(@season.start_year).to eql 2015
  end

  it 'should have end year' do
    expect(@season.end_year).to eql 2016
  end

  it 'should have league name' do
    expect(@season.league_name).to eql 'Premier League'
  end

  it 'should get clubs for season' do
    expect(@season.clubs.length).to eql 20
  end

  it 'should get club names for season' do
    expect(@season.clubs[0].name).to eql 'Arsenal'
    expect(@season.clubs[1].name).to eql 'Aston Villa'
  end

  it 'should have leader board for season' do
    expect(@season.leader_board.length).to eql 20
  end

  it 'should have point leader at top of leader board' do
    expect(@season.leader_board[0].points).to be > @season.leader_board[1].points
    expect(@season.leader_board[1].points).to be > @season.leader_board[2].points
    expect(@season.leader_board[2].points).to be > @season.leader_board[3].points
  end

  it 'should get referees for season' do
    expect(@season.referees.length).to eql 19
  end

  it 'should get referee names for season' do
    expect(@season.referees[0].name).to eql 'A Marriner'
    expect(@season.referees[1].name).to eql 'A Taylor'
  end

  it 'should get all matches for season' do
    expect(@season.matches.length).to eql 380
  end

  it 'should get match host' do
    expect(@season.matches[0].host).to eql 'Bournemouth'
    expect(@season.matches[1].host).to eql 'Chelsea'
  end

  it 'should get season as json' do
    json = @season.to_json
    expect_season_as_json json, @season
  end

  def expect_season_as_json(json, season)
    hash = JSON.parse json
    expect(hash['league_name']).to eql season.league_name
    expect(hash['start_year']).to eql season.start_year
    expect(hash['end_year']).to eql season.end_year
    expect(hash['clubs'].length).to eql season.clubs.length
    expect(hash['leader_board'].length).to eql season.leader_board.length
    expect(hash['referees'].length).to eql season.referees.length
  end
end