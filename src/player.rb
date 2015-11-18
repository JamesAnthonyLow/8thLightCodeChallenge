class Player
  attr_accessor :marker
  def initialize human
    @human = human 
  end
  def make_move move_input
    Hash[:move, move_input, :marker, marker]
  end
  def human?
    @human
  end
end
