module Computer
  class << self
    def choose_marker markers
      markers.sample
    end
    def get_move spaces
      available_moves.sort_by { |move| move_score(spaces, move) }
    end
    private
    def available_moves
      spaces.each_index.with_object([]) {|i, poss| poss << i if spaces[i].nil? }
    end
    def move_score spaces, move 
      
    end
  end
end 


