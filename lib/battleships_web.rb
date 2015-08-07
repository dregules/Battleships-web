require 'sinatra/base'
require_relative 'game'

class BattleshipsWeb < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views') }
  enable :sessions
  $game = Game.new

  get '/' do
    erb :index
  end

  post '/fire' do
    return "Game over" if $game.over?
    return "No..you wait!" unless $game.turn.name == session[:name]
    $game.make_move(params[:fire_location].to_sym)
  end

  get '/NewGame' do
    erb :newgame
  end

  get '/Game' do
    session[:name] = params[:name]
    $game.player_1 ? $game.player_2 = Player.new(params[:name]) : $game.player_1 = Player.new(params[:name])
    current_player = $game.player_1.name == session[:name] ? $game.player_1 : $game.player_2
    board = Board.new({ :size => 9, :cell => Cell , :number_of_pieces => 1 })
    board.fill_all_content(Water.new)
    board.place(Ship.new(:size => 1), :A1)
    current_player.board = board

    erb :game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
