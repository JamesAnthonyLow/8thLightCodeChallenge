class Board
  include Enumerable
  attr_reader :spaces, :win_status
  def initialize spaces
    @spaces = spaces || Array.new(9)
    @win_status = false
  end
  def game_over?
    if winner? "X"
      @win_status = "Player X wins!"
    elsif winner? "O"
      @win_status = "Player O wins!"
    else
      tie? 
    end
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
     [0, 4, 8], [2, 4, 6]].each {|idx| yield(@spaces[idx]) }
  end
  private 
  def tie?
    spaces.all? ? @win_status = "Tie!" : false
  end
  def winner? marker
    possible_wins.any? {|line| line.all? {|space| space == marker}}
  end
end

  
  
  
  
  
  
  d
  
  
  
  kkdsnd
