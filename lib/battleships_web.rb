require 'sinatra/base'
#require 'shotgun'


class BattleshipsWeb < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    erb :index
  end

  get '/NewGame' do
    erb :newgame
  end

  get '/Game' do
    @name = params[:Name]
    if @name == ''
      redirect '/NewGame'
    else
      erb :game
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
