require_relative "view"
require_relative "board"
class TicTacToe
  def initialize
    @board = Board.new
    View.welcome
    @players = View.get_game_type {|human| Player.new human}
    @players.each_with_object(["X", "O"]) do |player, markers|
      player.set_marker markers, -> {human? ? View.choose_marker : Computer.choose_marker}
    end
  end
  def start_game
    @players.cycle do |player|
      View.display_board @board.spaces
      move = @board.until_valid_move?(-> { View.try_again }) do
        player.choose_move -> {human? ? View.get_move : Computer.get_move(@board.spaces)}  
      end
      @board.place move
      break if @board.game_over?
    end
    View.end_game(@board.win_status)
  end
end
