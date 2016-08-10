require './src/seasons/season'

describe 'Season' do
  before do
    @season = Season.new 2015, 2016, 'Premier League'
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

  it 'should have leader board for season' do
    expect(@season.leader_board.length).to eql 20
  end

  it 'should have point leader at top of leader board' do
    expect(@season.leader_board[0].points).to be > @season.leader_board[1].points
  end
end