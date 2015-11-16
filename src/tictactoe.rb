require_relative "view"
require_relative "board"
require_relative "player"
require_relative "computer"
class TicTacToe
  def initialize
    @board = Board.new
    View.welcome
    @players = View.get_game_type {|human| Player.new human}
    @players.each_with_object(["X", "O"]) do |player, markers|
      player.set_marker -> {@human ? View.choose_marker(markers) : Computer.choose_marker(markers)}
    end
  end
  def start_game
    @players.cycle do |player|
      View.display_board @board.spaces
      move = @board.until_valid_move?(-> { View.try_again }) do
        player.choose_move -> {@human ? View.get_move : Computer.get_move(@board.spaces)}  
      end
      @board.place move
      break if @board.game_over?
    end
    View.end_game(@board.win_status)
  end
end
game = TicTacToe.new
game.start_game
