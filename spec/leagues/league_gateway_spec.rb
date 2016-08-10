require './src/leagues/league_gateway'
require './src/shared/footy_config'

describe 'LeagueGateway' do
  before do
    seasons_path = FootyConfig.seasons_directory
    @league_gateway = LeagueGateway.new seasons_path
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

  it 'should get seasons for league' do
    league = @league_gateway.get_by_name 'Premier League'
    expect(league.seasons.length).to eql 2
    expect(league.seasons[0].start_year).to eql 2015
    expect(league.seasons[1].start_year).to eql 2014
  end
end