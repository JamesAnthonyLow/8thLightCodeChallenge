require_relative "view"
require_relative "board"
require_relative "player"
class TicTacToe
  def initialize
    @board = Board.new
    View.welcome
    @players = get_game_type.map {|human| Player.new human}
    @players.each_with_object(["X", "O"]) do |player, markers|
      player.marker = get_marker_choice(player.human?, markers)
    end
  end
  def start_game
    @players.cycle do |player|
      View.prompt_player(player.marker)
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
  def get_marker_choice human, markers
    until_valid? do
      marker_choice = View.choose_marker(human, markers)
      break marker_choice unless marker_choice.nil?
    end
  end
  def get_player_move(player)
    until_valid? do
      move_input = View.get_move(player, @board.spaces) 
      move = player.make_move move_input
      break move if @board.valid_move? move[:move]
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
