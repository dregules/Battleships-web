require 'sinatra/base'
#require 'shotgun'


class BattleshipsWeb < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    erb :index
  end

  get '/NewGame' do
    "What's your name?"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
