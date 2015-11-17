require_relative "view"
require_relative "board"
require_relative "player"
require_relative "computer"
class TicTacToe
  def initialize
    @board = Board.new
    View.welcome
    @players = get_game_type.map {|human| Player.new human}
    @players.each_with_object(["X", "O"]) do |player, markers|
      get_marker_choice(player, markers)
    end
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
    until_valid? do
      game_type = View.user_select_game_type
      break game_type unless game_type.nil?
    end
  end
  def get_marker_choice(player, markers)
    until_valid? do
      marker_choice = player.set_marker do |human| 
        human ? View.choose_marker(markers) : Computer.choose_marker(markers)
      end
      break marker_choice unless marker_choice.nil?
    end
  end
  def get_player_move(player)
    until_valid? do
      move, player_marker = player.choose_move do |marker, human| 
        human ? View.get_move : Computer.get_move(marker, @board.spaces)
      end
      break Hash[:move, move, :marker, player_marker] if @board.valid_move? move
    end
  end
  def until_valid?
    loop do
      result = yield
      return result unless result.nil?
      View.try_again 
    end 
  end
end
game = TicTacToe.new
game.start_game
