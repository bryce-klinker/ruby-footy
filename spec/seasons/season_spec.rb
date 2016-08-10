require './src/seasons/season'

describe 'Season' do
  before do
    @season = Season.new 2015, 2016
  end

  it 'should have start year' do
    expect(@season.start_year).to eql 2015
  end

  it 'should have end year' do
    expect(@season.end_year).to eql 2016
  end

  it 'should have league name'
end