describe 'FootyApp' do
  it 'should get clubs for season' do
    get '/seasons/2015/2016/Premier_League/clubs'
    expect(last_response.status).to eql 200
  end
end