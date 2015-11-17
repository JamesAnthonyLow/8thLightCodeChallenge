require_relative "board"
module Computer
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
      Board.new(possible_spaces).possible_wins do |line|
        score += line.count(marker) 
        score -= line.count {|space| !space.nil? && space != marker}
      end
      score
    end
    def possible_moves(marker, spaces)
      spaces.each_index.with_object([]) {|i, poss| poss << spaces[i].nil?}
    end
  end
end 


