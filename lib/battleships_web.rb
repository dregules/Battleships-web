require 'sinatra/base'
require_relative 'game'


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
    @name = params[:name]
    if @name == ''
      redirect '/NewGame'
    else
      session[:player_1], session[:player_2] = Player.new(@name), Player.new('COMPUTER')
      @player_1, @player_2 = session[:player_1], session[:player_2]
      options = { :size => 100, :cell => Cell , :number_of_pieces => 1 }
      session[:board1], session[:board2] = Board.new(options), Board.new(options)
      @board1, @board2 = session[:board1], session[:board2]
      @player_1.board, @player_2.board = @board1, @board2
      session[:game] = Game.new(@player_1, @player_2)
      @game = session[:game]
      session[:ship_1], session[:ship_2] = Ship.battleship, Ship.battleship
      erb :game
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
