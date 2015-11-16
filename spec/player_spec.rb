require 'spec_helper'
describe Player do
  let(:player) { Player.new false }
  describe "#set_marker" do
    it "sets marker choice based on decision proc" do
      def choose_marker markers
        markers.first
      end
      player.set_marker -> { choose_marker(["X", "O"]) } 
      expect(player.instance_variable_get(:@marker)).to eq "X"
    end
  end
  describe "#choose_move" do
   it "outputs hash with key value pair representative of choice and marker" do     
     player.instance_variable_set(:@marker, "O")
     def move_choice
       3
     end
     expect(player.choose_move -> { move_choice }).to eq Hash[:move, 3, :marker, "O"]
   end
  end
end
