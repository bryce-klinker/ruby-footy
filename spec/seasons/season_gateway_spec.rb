require './src/seasons/season_gateway'
require './src/shared/data_path_helper'

describe 'SeasonGateway' do
  before do
    seasons_directory = get_seasons_directory_path
    @season_gateway = SeasonGateway.new seasons_directory
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
end