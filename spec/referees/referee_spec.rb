require './src/referees/referee_gateway'
require 'json'

describe 'Referee' do
  before do
    csv_path = get_season_csv_path 2015, 2016, 'Premier League'
    referee_gateway = RefereeGateway.new csv_path
    @referee = referee_gateway.get_all.first
  end

  it 'should convert referee to json' do
    json = @referee.to_json
    expect_referee_as_json json, @referee
  end

  def expect_referee_as_json(json, referee)
    hash = JSON.parse json
    expect(hash['name']).to eql referee.name
    expect(hash['red_cards_given']).to eql referee.red_cards_given
    expect(hash['yellow_cards_given']).to eql referee.yellow_cards_given
  end
end