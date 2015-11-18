require 'spec_helper'
describe PossibleWins do
  describe "#show" do
    it "returns 2 dimensional array representing winning space combinations" do
      spaces =  ["A", "B", "C",
                 "D", "E", "F",
                 "G", "H", "I"]
      possible_wins = [["A", "B", "C"], ["D", "E", "F"], ["G", "H", "I"],
                       ["A", "D", "G"], ["B", "E", "H"], ["C", "F", "I"],
                       ["A", "E", "I"], ["C", "E", "G"]]
      expect(PossibleWins.show(spaces)).to eq possible_wins
    end
  end
end
