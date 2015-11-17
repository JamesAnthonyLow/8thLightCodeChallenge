class Board
  attr_reader :spaces, :win_status
  def initialize spaces = Array.new(9)
    @spaces = spaces 
    @win_status = nil
  end
  def game_over?
    winner = winner? 
    @win_status = winner ? "Player #{winner} wins!" : tie?
  end
  def valid_move? move
    (0..@spaces.length).to_a.include?(move) && @spaces[move].nil?
  end
  def place player_move = {}
    @spaces[player_move[:move]] = player_move[:marker]
  end
  def possible_wins
    [[0, 1, 2], [3, 4, 5], [6, 7, 8],
     [0, 3, 6], [1, 4, 7], [2, 5, 8],
     [0, 4, 8], [2, 4, 6]].map do |indexes| 
       indexes.map {|idx| @spaces[idx]}
     end
  end
  private 
  def tie?
    spaces.all? ? @win_status = "Tie!" : false
  end
  def winner? marker
    possible_wins.any? {|line| line.all? {|space| space == marker}}
  end
end
