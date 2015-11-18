require_relative 'possible_wins'
class Board
  attr_reader :spaces, :win_status
  def initialize args={} 
    @markers = args[:markers] || ["O", "X"]
    @spaces = args[:spaces] || Array.new(9)
  end
  def game_over?
    winner = winner? 
    @win_status = winner ? "Player #{winner} wins!" : tie?
  end
  def valid_move? move_idx
    (0..@spaces.length).to_a.include?(move_idx) && @spaces[move_idx].nil?
  end
  def place player_move = {}
    @spaces[player_move[:move]] = player_move[:marker]
  end
  private 
  def tie?
    spaces.all? ? @win_status = "Tie!" : false
  end
  def winner? 
    @markers.each do |marker|
      return marker if PossibleWins.show(@spaces).any? {|ln| ln.all? {|sp| sp == marker}}
    end
    false
  end
end
