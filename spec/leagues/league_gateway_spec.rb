require './src/leagues/league_gateway'

describe 'LeagueGateway' do
  before do
    @league_gateway = LeagueGateway.new ENV['SEASONS_DIRECTORY']
  end

  it 'should get all leagues' do
    leagues = @league_gateway.get_all
    expect(leagues.length).to eql 2
  end

  it 'should get all league names' do
    leagues = @league_gateway.get_all
    expect(leagues[0].name).to eql 'Premier League'
    expect(leagues[1].name).to eql 'Championship'
  end

  it 'should get league by name' do
    league = @league_gateway.get_by_name 'Premier League'
    expect(league.name).to eql 'Premier League'
  end

  it 'should get league by name when "_" are in name' do
    league = @league_gateway.get_by_name 'Premier_League'
    expect(league.name).to eql 'Premier League'
  end

  it 'should get seasons for league' do
    league = @league_gateway.get_by_name 'Premier League'
    expect(league.seasons.length).to eql 2
    expect(league.seasons[0].start_year).to eql 2015
    expect(league.seasons[1].start_year).to eql 2014
  end
end