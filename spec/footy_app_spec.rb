require 'json'

describe 'FootyApp' do
  it 'should respond successfully to requests for clubs' do
    get '/seasons/2015/2016/Premier_League/clubs'
    expect(last_response.status).to eql 200
  end

  it 'should return all clubs for requested season' do
    get '/seasons/2014/2015/Premier_League/clubs'
    clubs = JSON.parse(last_response.body)
    expect(clubs.length).to be 20
  end
end