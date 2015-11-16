module Computer
  class << self
    def choose_marker markers
      markers.sample
    end
    def get_move spaces
      spaces.each_index.with_object([]) {|i, poss| poss << i if spaces[i].nil? }.sample
    end
  end
end
