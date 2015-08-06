require 'sinatra/base'
require_relative 'player'


class BattleshipsWeb < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views') }
  enable :sessions

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
      p 'Before assginment'
      p session
      session[:player1] = Player.new @name
      p session
      erb :game
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
