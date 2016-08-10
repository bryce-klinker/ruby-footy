require './src/referees/referee_gateway'

describe 'RefereeGateway' do
  before do
    filePath = File.expand_path '../../../data/csv/2015_2016_Premier_League.csv', __FILE__
    @referee_gateway = RefereeGateway.new filePath
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