require 'spec_helper'

describe View do
  describe "#welcome" do
    it "prints a welcome statement to STDOUT" do
      expect{View.welcome}.to output("Welcome to Tic Tac Toe!\n").to_stdout
    end
  end
  describe "#get_game_type" do
    context "user chooses human v human" do
      it "outputs array of true, true" do
        allow(STDIN).to receive(:gets) {"1\n"}
        expect(View.get_game_type).to eq [true, true]
      end
    end
    context "user chooses human v computer" do
      xit "outputs array of true, false" do
        allow(STDIN).to recieve(:gets) {"2"}
      end
    end
    context "user chooses computer v computer" do
      xit "outputs array of false, false" do
        allow(STDIN).to recieve(:gets) {"3"}
      end
    end
  end
  describe "#choose_marker" do
    pending
  end
  describe "#try_again" do
    pending
  end
  describe "#get_move" do
    pending
  end
end
