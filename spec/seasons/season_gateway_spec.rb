require './src/seasons/season_gateway'

describe 'SeasonGateway' do
  before do
    @season_gateway = SeasonGateway.new
  end

  it 'should get seasons with league name' do
    seasons = @season_gateway.get_by_league_name 'Premier League'
    expect(seasons.length).to eql 2
  end

  it 'should get season start year' do
    seasons = @season_gateway.get_by_league_name 'Premier League'
    expect(seasons[0].start_year).to eql 2015
    expect(seasons[1].start_year).to eql 2014
  end
end