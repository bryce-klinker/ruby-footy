require 'json'



describe 'FootyApp' do
  it 'should respond successfully to requests for clubs' do
    get '/seasons/2015/2016/Premier_League/clubs'
    expect(last_response.status).to eql 200
  end

  it 'should return all clubs for requested season' do
    get '/seasons/2014/2015/Premier_League/clubs'
    clubs = get_response_as_hash
    expect(clubs.length).to be 20
  end

  it 'should set content type to json for clubs response' do
    get '/seasons/2015/2016/Premier_League/clubs'
    expect(last_response.headers['content-type']).to eql 'application/json'
  end

  it 'should respond successfully to requests for leagues' do
    get '/leagues'
    expect(last_response.status).to eql 200
  end

  it 'should return all leagues for request' do
    get '/leagues'
    leagues = get_response_as_hash
    expect(leagues.length).to eql 2
  end

  it 'should set content type to json for leagues response' do
    get '/leagues'
    expect(last_response.headers['content-type']).to eql 'application/json'
  end

  it 'should respond successfully to requests for league' do
    get '/leagues/Premier_League'
    expect(last_response.status).to eql 200
  end

  it 'should return league for request' do
    get '/leagues/Championship'
    league = get_response_as_hash
    expect(league['name']).to eql 'Championship'
  end

  it 'should respond successfully to requests for referees for a season' do
    get '/seasons/2015/2016/Premier_League/referees'
    expect(last_response.status).to eql 200
  end

  it 'should return referees for season' do
    get '/seasons/2015/2016/Premier_League/referees'
    referees = get_response_as_hash
    expect(referees.length).to eql 19
  end

  def get_response_as_hash
    JSON.parse last_response.body
  end
end