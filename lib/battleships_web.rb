require 'sinatra/base'
require_relative 'game'

class BattleshipsWeb < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views') }

  enable :sessions
  $game = Game.new

  get '/' do
    erb :index
  end


  get '/NewGame' do
    erb :newgame
  end

  get '/Game' do
    redirect '/NewGame' if params[:name] == ''
    session[:name] = params[:name]

    erb :game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
