require './src/clubs/club_gateway'

describe 'ClubGateway' do
  before do
    filePath = File.expand_path '../../../data/csv/2015_2016_Premier_League_Results.csv', __FILE__
    @club_gateway = ClubGateway.new filePath
  end

  describe 'getAll' do
    it 'should get all clubs' do
      clubs = @club_gateway.getAll
      expect(clubs.length).to eq(20)
    end

    it 'should get club names' do
      clubs = @club_gateway.getAll
      expect(clubs[0][:name]).to eq('Arsenal')
    end

    it 'should get wins for club' do
      clubs = @club_gateway.getAll
      expect(clubs[0][:wins]).to eql(20)
    end
  end
end