require 'pry'
require_relative "board"
module Computer
  @@move_score_hash = Hash[[2, 1, 0], -1000, #opponent wins
                           [1, 2, 0], -1, #leave open
                           [1, 1, 1], 0, #tie
                           [1, 0, 2], 0, #tie
                           [0, 3, 0], 0, #all empty
                           [0, 2, 1], 1, #possible win
                           [0, 1, 2], 2, #close to win
                           [2, 0, 1], 3, #stop opponent
                           [0, 0, 3], 1000] #win
  class << self
    def choose_marker markers
      markers.sample
    end
    def get_move marker, board
      spaces = board.spaces
      possible_moves(marker, spaces).sort_by {|move| move_score(move, spaces, marker)}.pop
    end
    private
    def move_score move, spaces, marker
      possible_spaces, possible_spaces[move] = spaces.dup, marker
      score = 0
      Board.new(possible_spaces).possible_wins.each do |line|
        opponent = line.count {|space| space != marker && !space.nil?}
        empty = line.count(nil)
        mine = line.count(marker)
        score += move_score_hash[[opponent, empty, mine]]
      end
      score
    end
    def possible_moves(marker, spaces)
      spaces.each_index.with_object([]) {|i, poss| poss << i if spaces[i].nil?}
    end
    def move_score_hash
      @@move_score_hash
    end
  end
end 


