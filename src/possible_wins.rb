module PossibleWins
  extend self
  def show spaces
    [[0, 1, 2], [3, 4, 5], [6, 7, 8],
     [0, 3, 6], [1, 4, 7], [2, 5, 8],
     [0, 4, 8], [2, 4, 6]].map do |indexes| 
       indexes.map {|idx| spaces[idx]}
     end
  end
end
