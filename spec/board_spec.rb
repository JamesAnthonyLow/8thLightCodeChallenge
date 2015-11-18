require 'spec_helper'
describe Board do
  let(:board) { Board.new }
  context "attributes" do
    describe "@spaces" do
      it "has length of 9" do
        expect(board.spaces.length).to eq 9
      end
    end
    describe "@win_status" do
      context "tie" do
        it "contains tie message as string" do
          board = Board.new(spaces: ["O", "X", "O",
                                     "X", "X", "O",
                                     "O", "O", "X"])
          board.game_over?
          expect(board.win_status).to eq "Tie!"
        end
      end
      context "player X win" do
        it "contains player X win message as string" do
          board = Board.new(spaces: ["X", "X", "O",
                                     "X", "X", "O",
                                     "O", "O", "X"])
          board.game_over?
          expect(board.win_status).to eq "Player X wins!"
        end
      end
      context "player O win" do
        it "contains player O win message as string" do
          board = Board.new(spaces: ["O", "X", "O",
                                     "O", "X", "O",
                                     "O", "O", "X"])
          board.game_over?
          expect(board.win_status).to eq "Player O wins!"
        end
      end
    end
  end
  context "public methods" do
    describe "#game_over?" do
      context "game over" do
        it "outputs true" do
          board = Board.new(spaces: ["O", "X", "O",
                                     "O", "X", "O",
                                     "O", "O", "X"])
          expect(board.game_over?).to be_truthy
        end
      end
      context "game not over" do
        it "outputs false" do
          board = Board.new(spaces: ["O", "X", "O",
                                     nil, "X", "O",
                                     "O", "O", "X"])
          expect(board.game_over?).to be_falsey
        end
      end
    end
    describe "#valid_move?" do
      context "valid move" do
         it "returns true" do
           expect(board.valid_move? 4).to be_truthy 
         end
      end
      context "invalid move" do
        it "returns false if space taken" do
          board.place Hash[:move, 4, :marker, "X"] 
          expect(board.valid_move? 4).to be_falsey
        end
        it "returns false if space does not exist" do
          expect(board.valid_move? 10).to be_falsey
        end
      end
    end
    describe "#place" do
      context "accepts player_move hash" do
        it "places move accordingly" do
          board.place Hash[:move, 5, :marker, "O"]
          expect(board.spaces[5]).to eq "O"
        end
      end
    end
  end
 end
