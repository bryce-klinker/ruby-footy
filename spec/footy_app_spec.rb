require 'json'

describe 'FootyApp' do
  it 'should respond successfully to requests for clubs' do
    get '/leagues/Premier_League/seasons/2015/2016/clubs'
    clubs = get_response_as_hash

    expect(clubs.length).to be 20
    expect_successful_response
    expect_content_type_json
  end

  it 'should respond successfully to requests for leagues' do
    get '/leagues'

    leagues = get_response_as_hash
    expect(leagues.length).to eql 2
    expect_successful_response
    expect_content_type_json
  end

  it 'should respond successfully to requests for league' do
    get '/leagues/Premier_League'

    league = get_response_as_hash
    expect(league['name']).to eql 'Premier League'
    expect_successful_response
    expect_content_type_json
  end

  it 'should respond successfully to requests for referees for a season' do
    get '/leagues/Premier_League/seasons/2015/2016/referees'

    referees = get_response_as_hash
    expect(referees.length).to eql 19
    expect_successful_response
    expect_content_type_json
  end

  def expect_successful_response
    expect(last_response.status).to eql 200
  end

  def get_response_as_hash
    JSON.parse last_response.body
  end

  def expect_content_type_json
    expect(last_response.headers['content-type']).to eql 'application/json'
  end
end