require 'spec_helper'
require 'victory_checker'

describe VictoryChecker do
  let(:board) {board = double('board', 'grid' => {1 => ' ', 2 => ' ', 3 => ' ',
                                                  4 => ' ', 5 => ' ', 6 => ' ',
                                                  7 => ' ', 8 => ' ', 9 => ' '})}
  let(:victory_checker) { VictoryChecker.new }
  describe '#check_for_win' do
    it "should return 'X' if any row has all X's" do
      board.grid[7], board.grid[8], board.grid[9] = 'X', 'X', 'X'
      expect(victory_checker.check_for_win(board.grid)).to eq 'X'
    end

    it "should return 'O' if any row has all O's" do
      board.grid[4], board.grid[5], board.grid[6] = 'O', 'O', 'O'
      expect(victory_checker.check_for_win(board.grid)).to eq 'O'
    end

    it "should return nil if there are no horizontal wins" do
      board.grid[4], board.grid[5] = 'O', 'O'
      expect(victory_checker.check_for_win(board.grid)).to be_nil
    end

    it "should return 'X' if any column has all X's" do
      board.grid[2], board.grid[5], board.grid[8] = 'X', 'X', 'X'
      expect(victory_checker.check_for_win(board.grid)).to eq 'X'
    end

    it "should return 'O' if any column has all O's" do
      board.grid[1], board.grid[4], board.grid[7] = 'O', 'O', 'O'
      expect(victory_checker.check_for_win(board.grid)).to eq 'O'
    end

    it "should return nil if there are no vertical wins" do
      board.grid[1], board.grid[7] = 'O', 'O'
      expect(victory_checker.check_for_win(board.grid)).to be_nil
    end

    it "should return 'X' if any column has all X's" do
      board.grid[1], board.grid[5], board.grid[9] = 'X', 'X', 'X'
      expect(victory_checker.check_for_win(board.grid)).to eq 'X'
    end

    it "should return 'O' if any column has all O's" do
      board.grid[3], board.grid[5], board.grid[7] = 'O', 'O', 'O'
      expect(victory_checker.check_for_win(board.grid)).to eq 'O'
    end

    it "should return nil if there are no vertical wins" do
      board.grid[1], board.grid[9] = 'O', 'O'
      expect(victory_checker.check_for_win(board.grid)).to be_nil
    end

    context "stalemate" do
      it "should return 'Game is a Stalemate' if no one wins and all spaces are filled" do
        board = double('board', 'grid' => {1 => 'X', 2 => 'O', 3 => 'X',
                                           4 => 'X', 5 => 'O', 6 => 'O',
                                           7 => 'O', 8 => 'X', 9 => 'X'})
        expect(victory_checker.check_for_win(board.grid)).to eq 'Game is a Stalemate'
      end
    end
  end
end