require './src/referees/referee_gateway'
require './src/shared/footy_config'

describe 'RefereeGateway' do
  before do
    csv_path = get_season_csv_path 2015, 2016, 'Premier League'
    @referee_gateway = RefereeGateway.new csv_path
  end

  it 'should get all referees' do
    referees = @referee_gateway.get_all
    expect(referees.length).to eql 19
  end

  it 'should get referee name' do
    referees = @referee_gateway.get_all
    expect(referees[0].name).to eql 'A Marriner'
  end

  it 'should get red cards given' do
    referees = @referee_gateway.get_all
    expect(referees[2].red_cards_given).to eql 2
    expect(referees[3].red_cards_given).to eql 1
  end

  it 'should get yellow cards given' do
    referees = @referee_gateway.get_all
    expect(referees[4].yellow_cards_given).to eql 71
    expect(referees[5].yellow_cards_given).to eql 59
  end
end