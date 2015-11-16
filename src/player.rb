class Player
  def initialize human
    @human = human 
    @marker = nil
  end
  def set_marker choose_marker
    @marker = choose_marker.call
  end
  def choose_move move_decision
    move = move_decision.call
    Hash[:move, move, :marker, @marker]
  end
end
