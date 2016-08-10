require './src/leagues/league_gateway'
require './src/shared/data_path_helper'

describe 'LeagueGateway' do
  before do
    seasons_path = get_seasons_directory_path
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
end