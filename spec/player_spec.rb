require 'spec_helper'
describe Player do
  let(:player) { Player.new false }
  describe "#set_marker" do
    def choose_marker marker
      marker.first
    end
    player.set_marker ["O", "X"],  -> { choose_marker } 
    expect(player.instance_variable_get(:@marker)).to eq "O"
  end
  describe "#choose_move" do

  end
end
