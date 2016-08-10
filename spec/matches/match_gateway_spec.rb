require './src/matches/match_gateway'
require './src/shared/footy_config'

describe 'MatchGateway' do
  before do
    csv_path = File.expand_path "#{FootyConfig.seasons_directory}/2015_2016_Premier_League.csv", __FILE__
    @match_gateway = MatchGateway.new csv_path
  end

  it 'should have match date' do
    match = @match_gateway.get_all[0]
    expect(match.date).to eql Date.parse '08/08/15'
  end
end