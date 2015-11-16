class Board
  attr_reader :spaces, :reader
  def initialize
    @spaces = Array.new(9)
    @win_status = false
    @possible_wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                      [0, 3, 6], [1, 4, 7], [2, 5, 8],
                      [0, 4, 8], [2, 4, 6]]
  end
  def game_over?
  end
  def until_valid_move?
  end
  private 
  def tie?
    spaces.all? #full
  end
  def winner marker
    @possible_wins.any? {|line| line.all? {|idx| spaces[idx] == marker}}
  end
end
