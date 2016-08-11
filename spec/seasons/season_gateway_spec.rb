require './src/seasons/season_gateway'

describe 'SeasonGateway' do
  before do
    @season_gateway = SeasonGateway.new ENV['SEASONS_DIRECTORY']
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

  it 'should get season end year' do
    seasons = @season_gateway.get_by_league_name 'Premier League'
    expect(seasons[0].end_year).to eql 2016
    expect(seasons[1].end_year).to eql 2015
  end

  it 'should get league name' do
    seasons = @season_gateway.get_by_league_name 'Premier League'
    expect(seasons[0].league_name).to eql 'Premier League'
  end

  it 'should get season for start year, end year, and league name' do
    season = @season_gateway.get_season '2015', '2016', 'Premier League'
    expect(season.start_year).to eql 2015
    expect(season.end_year).to eql 2016
    expect(season.league_name).to eql 'Premier League'
  end
end