require './src/clubs/club_gateway'
require './src/clubs/club'
require 'json'

describe 'Club' do
  before do
    csv_path = get_season_csv_path 2015, 2016, 'Premier League'
    club_gateway = ClubGateway.new csv_path
    @club = club_gateway.get_all.first
  end

  it 'should create hash of club' do
    json = @club.to_json
    expect_club_as_json json, @club
  end

  def expect_club_as_json(json, club)
    hash = JSON.parse json
    expect(hash['name']).to eql club.name
    expect(hash['wins']).to eql club.wins
    expect(hash['draws']).to eql club.draws
    expect(hash['losses']).to eql club.losses
    expect(hash['points']).to eql club.points
    expect(hash['goals_allowed']).to eql club.goals_allowed
    expect(hash['goals_scored']).to eql club.goals_scored
    expect(hash['goal_differential']).to eql club.goal_differential
  end

end