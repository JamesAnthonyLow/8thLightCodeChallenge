require_relative "possible_wins"
class Computer
  @@move_score_hash = Hash[[2, 0], -1000, #opponent wins
                           [1, 0], -4, #leave open
                           [1, 1], 0, #tie
                           [1, 2], 0, #tie
                           [0, 0], 0, #all empty
                           [0, 1], 1, #possible win
                           [0, 2], 2, #close to win
                           [2, 1], 3, #stop opponent
                           [0, 3], 1000] #win
  class << self
    def choose_marker choices 
      choices.keys.sample
    end
    def get_move marker, spaces
      possible_moves(marker, spaces).sort_by {|move| move_score(move, spaces, marker)}.pop
    end
    private
    def move_score move, spaces, marker
      possible_spaces, possible_spaces[move] = spaces.dup, marker
      line_scores = PossibleWins.show(possible_spaces).map do |line|
        mine, opponent = line.count(marker), line.count {|space| space != marker && !space.nil?}
        move_score_hash[[opponent, mine]]
      end
      line_scores.reduce(:+)
    end
    def possible_moves(marker, spaces)
      spaces.each_index.with_object([]) {|i, poss| poss << i if spaces[i].nil?}
    end
    def move_score_hash
      @@move_score_hash
    end
  end
end 
