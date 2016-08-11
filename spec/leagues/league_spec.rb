require './src/leagues/league_gateway'
require 'json'

describe 'League' do
  before do
    league_gateway = LeagueGateway.new FootyConfig.seasons_directory
    @league = league_gateway.get_all.first
  end

  it 'should convert league to json' do
    json = @league.to_json
    expect_league_as_json json, @league
  end

  def expect_league_as_json(json, league)
    hash = JSON.parse json
    expect(hash['name']).to eql league.name
    expect(hash['seasons'].length).to eql 2
    expect(hash['seasons'][0]['start_year']).to eql 2015
  end
end