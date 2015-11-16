require 'spec_helper'
describe Board do
  let(:board) { Array.new(9) }
  describe "@spaces" do
    it "has length of 9" do
      expect(board.length).to eq 9
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
    xit "loops until valid input selected" do
    end
  end
end
