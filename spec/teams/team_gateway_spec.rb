require File.expand_path '../../src/teams/team_gateway.rb', __FILE__

describe 'TeamGateway' do
  before do
    filePath = File.expand_path '../../data/csv/2015_2016_Premier_League_Results.csv', __FILE__
    @team_gateway = TeamGateway.new filePath
  end

  describe 'getAll' do
    teams = @team_gateway.getAll
    expect(teams.size).to equal(20)
  end
end