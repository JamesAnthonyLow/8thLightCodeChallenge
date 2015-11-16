class Player
  def initialize human
    @human = human 
    @marker = nil
  end
  def set_marker &choice_bloc
    @marker = choice_bloc.call(human?) 
  end
  def choose_move &move_decision
    move = move_decision.call(human?)
    [move, @marker]
  end
  def human?
    @human
  end
end
