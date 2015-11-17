require_relative "view"
require_relative "board"
require_relative "player"
require_relative "computer"
class TicTacToe
  def initialize
    @board = Board.new
    View.welcome
    @players = get_game_type.map {|human| Player.new human}
    choose_markers(@players, ["X", "O"])
  end
  def start_game
    @players.cycle do |player|
      View.display_board @board.spaces
      @board.place get_player_move(player)
      break if @board.game_over?
    end
    View.end_game(@board.win_status)
  end
  private
  def get_game_type
    loop do
      game_type = View.user_select_game_type
      return game_type unless game_type.nil?
      View.try_again
    end
  end
  def choose_markers(players, choices)
    players.each_with_object(choices) do |player, markers|
      player.set_marker {|human| human ? View.choose_marker(markers) : Computer.choose_marker(markers)}
    end
  end
  def get_player_move(player)
    loop do
      move, marker = player.choose_move do |human| 
        human ? View.get_move : Computer.get_move(@board.spaces)
      end
      return Hash[:move, move, :marker, marker] if @board.valid_move? move
      View.try_again
    end
  end
end
game = TicTacToe.new
game.start_game
