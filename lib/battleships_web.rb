require 'sinatra/base'
require_relative 'game'
require_relative 'water'
require_relative 'cell'



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
    # p 'this is the paramaters'
    # p params
    # p 'and the frozen @name'
    # p @name
    # if @name == ''
    #   redirect '/NewGame'
    # else

    #   session[:player_1], session[:player_2] = Player.new(@name), Player.new('COMPUTER')
    #   @player_1, @player_2 = session[:player_1], session[:player_2]
    #   # options = { :size => 100, :cell => Cell , :number_of_pieces => 1 }
    #   # session[:board1], session[:board2] = Board.new(options), Board.new(options)
    #   # @board1, @board2 = session[:board1], session[:board2]
    #   # @player_1.board, @player_2.board = @board1, @board2
    #   # session[:game] = Game.new(@player_1, @player_2)
    #   # @game = session[:game]
    #   # session[:ship_1], session[:ship_2] = Ship.battleship, Ship.battleship
    #   # @game.player_2.board.place(session[:ship_2], :A2, :vertically)
    #   puts "Player 1 name"
    #   puts @player_1.name
    #   puts "Session hash"
    #   p session
      p $game
      erb :game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
