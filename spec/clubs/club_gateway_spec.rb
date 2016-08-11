require './src/clubs/club_gateway'

describe 'ClubGateway' do
  before do
    csv_path = get_season_csv_path 2015, 2016, 'Premier League'
    @club_gateway = ClubGateway.new csv_path
  end

  describe 'getAll' do
    it 'should get all clubs' do
      clubs = @club_gateway.get_all
      expect(clubs.length).to eql 20
    end

    it 'should get club names' do
      clubs = @club_gateway.get_all
      expect(clubs[0].name).to eql 'Arsenal'
    end

    it 'should get wins for club' do
      clubs = @club_gateway.get_all
      expect(clubs[0].wins).to eql 20
    end

    it 'should get draws for club' do
      clubs = @club_gateway.get_all
      expect(clubs[0].draws).to eql 11
    end

    it 'should get losses for club' do
      clubs = @club_gateway.get_all
      expect(clubs[0].losses).to eql 7
    end

    it 'should get points for club' do
      clubs = @club_gateway.get_all
      expect(clubs[0].points).to eql 71
    end

    it 'should get goals allowed for club' do
      clubs = @club_gateway.get_all
      expect(clubs[0].goals_allowed).to eql 36
    end

    it 'should get goals scored for club' do
      clubs = @club_gateway.get_all
      expect(clubs[0].goals_scored).to eql 65
    end

    it 'should get goal differential for club' do
      clubs = @club_gateway.get_all
      expect(clubs[0].goal_differential).to eql 29
    end
  end
end