require 'spec_helper'
describe Computer do
  describe "#get_move" do
    context "given a large number of games" do
      it "computer players will always tie" do
        outcomes = Array.new(1000).map do 
          board = Board.new 
          ["X", "O"].cycle do |marker|
            move = Computer.get_move(marker, board.spaces)
            board.place Hash[:move, move, :marker, marker]
            break if board.game_over?
          end
          board.win_status
        end.uniq
        expect(outcomes.all? {|win_st| win_st == "Tie!"}).to be_truthy
      end
      it "computer never loses to random selection" do
        outcomes = Array.new(9000).map do
          board = Board.new
          loop do
            computer_move = Computer.get_move("X", board.spaces)
            board.place Hash[:move, computer_move, :marker, "X"]
            break if board.game_over?
            random_move = board.spaces.each_with_index.with_object([]) do |(sp, i), r|
              r << i if sp.nil?
            end.sample
            board.place Hash[:move, random_move, :marker, "O"]
            break if board.game_over?
          end
          board.win_status
        end
        expect(outcomes.all? {|win| win == "Tie!" || win == "Player X wins!"}).to be_truthy
      end
    end
  end
end
