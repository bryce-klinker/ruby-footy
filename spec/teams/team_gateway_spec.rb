require './src/teams/team_gateway'

describe 'TeamGateway' do
  before do
    filePath = File.expand_path '../../data/csv/2015_2016_Premier_League_Results.csv', __FILE__
    @team_gateway = TeamGateway.new filePath
  end

  describe 'getAll' do
    it 'should get all teams' do
      teams = @team_gateway.getAll
      expect(teams.size).to equal(20)
    end
  end
end