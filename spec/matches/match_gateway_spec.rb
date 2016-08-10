require './src/matches/match_gateway'
require './src/shared/footy_config'

describe 'MatchGateway' do
  before do
    csv_path = get_season_csv_path 2015, 2016, 'Premier League'
    @match_gateway = MatchGateway.new csv_path
  end

  it 'should have match date' do
    match = @match_gateway.get_all[0]
    expect(match.date).to eql Date.parse '08/08/15'
  end
end