require './src/leagues/league_gateway'
require 'json'

describe 'League' do
  before do
    before do
      league_gateway = LeagueGateway.new FootyConfig.seasons_directory
      @league = league_gateway.get_all.first
    end
  end

  it 'should convert league to json' do
    json = @league.to_json
    expect_league_as_json json, @league
  end

  def expect_league_as_json(json, league)
    hash = JSON.parse json
    expect(hash[:name]).to eql league.name
  end
end