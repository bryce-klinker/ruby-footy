require './src/referees/referee_gateway'

describe 'RefereeGateway' do
  before do
    filePath = File.expand_path '../../../data/csv/2015_2016_Premier_League_Results.csv', __FILE__
    @referee_gateway = RefereeGateway.new filePath
  end

  it 'should get all referees' do
    referees = @referee_gateway.getAll
    expect(referees.length).to eql 19
  end

  it 'should get referee name' do
    referees = @referee_gateway.getAll
    expect(referees[0].name).to eql 'A Marriner'
  end
end