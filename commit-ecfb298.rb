
# <!--    <%if $game.turn.name == session[:name]%>
#     its your turn
#     <%else%>
#     wait for your turn
#     <%end%> -->

  # post '/fire' do
  #   return "Game over" if $game.over?
  #   return "No..you wait!" unless $game.turn.name == session[:name]
  #   $game.make_move(params[:fire_location].to_sym)
  # end



# #The name passed in the parameter is stored into the session as :name
#     session[:name] = params[:name]

#     #if game has the player_1 created, then we initialize player 2 instead. Otherwise, player_1 must be initialized
#     $game.player_1 ? $game.player_2 = Player.new(params[:name]) : $game.player_1 = Player.new(params[:name])

#     #Assign a current player for each turn depending on whose current session it is. By default, the turn is for the player 1
#     current_player = $game.player_1.name == session[:name] ? $game.player_1 : $game.player_2

#     #Create a board and fill it it all with content (maybe a method)
#     board = Board.new({ :size => 9, :cell => Cell , :number_of_pieces => 1 })
#     board.fill_all_content(Water.new)

#     # place a ship inside a board,
#     board.place(Ship.new(:size => 1), :A1)
#     # assign the newly created board to current/player's board to
#     current_player.board = board