require 'spec_helper'
describe Board do
  let(:board) { Board.new }
  describe "@spaces" do
    it "has length of 9" do
      expect(board.spaces.length).to eq 9
    end
  end
  describe "@win_status" do
    context "tie" do
      xit "contains tie message as string" do
      end
    end
    context "player X win" do
      xit "contains player X win message as string" do
      end
    end
    context "player O win" do
      xit "contains player O win message as string" do
      end
    end
  end
  describe "#game_over?" do
    context "game over" do
      xit "outputs true" do
      end
    end
    context "game not over" do
      xit "outputs false" do
      end
    end
  end
  describe "#until_valid_move?" do
    context "loops until valid input selected" do
      it "outputs move, marker hash" do 
        try_again = -> { puts "try again!" }
        move = board.until_valid_move?(try_again) do
          [0, "X"] 
        end
        expect(move).to eq Hash[:move, 0, :marker, "X"]
      end
      xit "calls try_again if not reached on first loop" do
      end
    end
  end
end
