require './src/leagues/league_gateway'

describe 'LeagueGateway' do
  before do
    seasons_path = File.expand_path './data/seasons'
    @league_gateway = LeagueGateway.new seasons_path
  end

  it 'should get all leagues' do
    leagues = @league_gateway.get_all
    expect(leagues.length).to eql 1
  end
end