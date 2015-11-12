class TicTacToe
  def initialize
    @board = Board.new
    View.welcome
    @players = View.map_setup_players(["X", "O"]) do |human, markers|
      if human
        Player.new :human => true, :marker => View.choose_marker(markers)
      else
        Player.new :human => false, :marker => Computer.choose_marker(markers)
      end
    end  
  end
  def start_game
    until @board.game_over?
      @players.each do |player|
      end
    end
  end
end
