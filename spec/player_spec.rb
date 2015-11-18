require 'spec_helper'
describe Player do
  let(:player) { Player.new false }
  context "attributes" do
    describe "@marker" do
      it "is readable" do
        player.instance_variable_set(:@marker, "O")
        expect(player.marker).to eq player.instance_variable_get(:@marker)
      end
      it "is writable" do
        player.marker = "X"
        expect(player.instance_variable_get(:@marker)).to eq "X"
      end
    end
    describe "@human" do
      context "#human?" do
        it "is readable" do
          expect(player.human?).to eq player.instance_variable_get(:@human)
        end
      end
    end
  end
  context "public methods" do
    describe "#make_move" do
      context "given an index representing a move" do
        it "formats data accordingly" do
          player.marker = "X"
          expect(player.make_move 3).to eq Hash[:move, 3, :marker, "X"]
        end
      end
    end
  end
end
