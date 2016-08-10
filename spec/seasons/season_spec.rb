require './src/seasons/season'

describe 'Season' do
  it 'should have start year' do
    season = Season.new 2015
    expect(season.start_year).to eql 2015
  end
end