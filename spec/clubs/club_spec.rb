require './src/clubs/club_gateway'
require './src/clubs/club'

describe 'Club' do
  before do
    csv_path = get_season_csv_path 2015, 2016, 'Premier League'
    club_gateway = ClubGateway.new csv_path
    @club = club_gateway.get_all.first
  end

  it 'should create hash of club' do
    hash = @club.to_json
    expect(hash[:name]).to eql 'Arsenal'
  end
end