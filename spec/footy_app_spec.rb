require 'json'

describe 'FootyApp' do
  it 'should respond successfully to requests for clubs' do
    get '/seasons/2015/2016/Premier_League/clubs'
    expect(last_response.status).to eql 200
  end

  it 'should return all clubs for requested season' do
    get '/seasons/2014/2015/Premier_League/clubs'
    clubs = JSON.parse last_response.body
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
    leagues = JSON.parse last_response.body
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
end