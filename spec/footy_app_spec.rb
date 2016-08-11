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

  it 'should respond successfully to requests for season' do
    get '/leagues/Premier_League/seasons/2015/2016'

    season = get_response_as_hash
    expect(season['league_name']).to eql 'Premier League'
    expect(season['start_year']).to eql 2015
    expect(season['end_year']).to eql 2016
    expect(season['clubs']).to eql nil
    expect(season['matches']).to eql nil
    expect(season['referees']).to eql nil
    expect(season['leader_board']).to eql nil

    expect_successful_response
    expect_content_type_json
  end

  it 'should return season with clubs data' do
    get '/leagues/Premier_League/seasons/2015/2016?include=clubs'

    season = get_response_as_hash
    expect(season['clubs'].length).to be 20
  end

  it 'should return season with leader board data' do
    get '/leagues/Premier_League/seasons/2015/2016?include=leader_board'

    season = get_response_as_hash
    expect(season['leader_board'].length).to be 20
  end

  it 'should return season with referee data' do
    get '/leagues/Premier_League/seasons/2015/2016?include=referees'

    season = get_response_as_hash
    expect(season['referees'].length).to be 19
  end

  it 'should return season with match data' do
    get '/leagues/Premier_League/seasons/2015/2016?include=matches'

    season = get_response_as_hash
    expect(season['matches'].length).to be 380
  end

  it 'should return season with match and club data' do
    get '/leagues/Premier_League/seasons/2015/2016?include=clubs,matches'

    season = get_response_as_hash
    expect(season['matches'].length).to be 380
    expect(season['clubs'].length).to be 20
  end

  it 'should respond successfully to requests for seasons' do
    get '/leagues/Premier_League/seasons'

    seasons = get_response_as_hash
    expect(seasons.length).to eql 2
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