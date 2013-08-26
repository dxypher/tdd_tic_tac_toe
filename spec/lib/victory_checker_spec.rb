require 'spec_helper'
require 'victory_checker'

describe VictoryChecker do
  describe '#horizontal_win' do
    it "should return 'X' if any row has all X's" do
      victory_checker = VictoryChecker.new
      board = double('board', 'grid' => {1 => ' ', 2 => ' ', 3 => ' ',
                                       4 => ' ', 5 => ' ', 6 => ' ',
                                       7 => 'X', 8 => 'X', 9 => 'X'})
      expect(victory_checker.horizontal_win(board.grid)).to eq 'X'
    end
  end
end