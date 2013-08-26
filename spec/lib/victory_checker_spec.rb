require 'spec_helper'
require 'victory_checker'

describe VictoryChecker do
  let(:board) {board = double('board', 'grid' => {1 => ' ', 2 => ' ', 3 => ' ',
                                                  4 => ' ', 5 => ' ', 6 => ' ',
                                                  7 => ' ', 8 => ' ', 9 => ' '})}
  describe '#horizontal_win' do
    it "should return 'X' if any row has all X's" do
      victory_checker = VictoryChecker.new
      board.grid[7], board.grid[8], board.grid[9] = 'X', 'X', 'X'
      expect(victory_checker.horizontal_win(board.grid)).to eq 'X'
    end

    it "should return 'O' if any row has all O's" do
      victory_checker = VictoryChecker.new
      board.grid[4], board.grid[5], board.grid[6] = 'O', 'O', 'O'
      expect(victory_checker.horizontal_win(board.grid)).to eq 'O'
    end

    it "should return nil if there are no horizontal wins" do
      victory_checker = VictoryChecker.new
      board.grid[4], board.grid[5] = 'O', 'O'
      expect(victory_checker.horizontal_win(board.grid)).to be_nil
    end
  end
end