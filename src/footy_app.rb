require 'sinatra/base'

class Footy < Sinatra::Base
  get '/' do
    'Hello Footy!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
