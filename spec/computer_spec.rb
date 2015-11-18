require 'spec_helper'
describe Computer do
  describe "#choose_marker" do
  end
  describe "#get_move" do
    context "given a large number of games" do
      it "computer players will always tie" do
        outcomes = Array.new(1000).map do 
          board = Board.new 
          ["X", "O"].cycle do |marker|
            move = Computer.get_move(marker, board)
            board.place Hash[:move, move, :marker, marker]
            break if board.game_over?
          end
          board.win_status
        end.uniq
        expect(outcomes.all? {|win_st| win_st == "Tie!"}).to be_truthy
      end
    end
  end
end
