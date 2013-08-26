require 'spec_helper'
require 'victory_checker'

describe VictoryChecker do
  let(:board) {board = double('board', 'grid' => {1 => ' ', 2 => ' ', 3 => ' ',
                                                  4 => ' ', 5 => ' ', 6 => ' ',
                                                  7 => ' ', 8 => ' ', 9 => ' '})}
  let(:victory_checker) { VictoryChecker.new }
  context '#horizontal_win' do
    it "should return 'X' if any row has all X's" do
      board.grid[7], board.grid[8], board.grid[9] = 'X', 'X', 'X'
      expect(victory_checker.horizontal_win(board.grid)).to eq 'X'
    end

    it "should return 'O' if any row has all O's" do
      board.grid[4], board.grid[5], board.grid[6] = 'O', 'O', 'O'
      expect(victory_checker.horizontal_win(board.grid)).to eq 'O'
    end

    it "should return nil if there are no horizontal wins" do
      board.grid[4], board.grid[5] = 'O', 'O'
      expect(victory_checker.horizontal_win(board.grid)).to be_nil
    end
  end

  context "vertical_win" do
    it "should return 'X' if any column has all X's" do
      board.grid[2], board.grid[5], board.grid[8] = 'X', 'X', 'X'
      expect(victory_checker.vertical_win(board.grid)).to eq 'X'
    end

    it "should return 'O' if any column has all O's" do
      board.grid[1], board.grid[4], board.grid[7] = 'O', 'O', 'O'
      expect(victory_checker.vertical_win(board.grid)).to eq 'O'
    end

    it "should return nil if there are no vertical wins" do
      board.grid[1], board.grid[7] = 'O', 'O'
      expect(victory_checker.vertical_win(board.grid)).to be_nil
    end
  end

  context "diagonal_win" do
    it "should return 'X' if any column has all X's" do
      board.grid[1], board.grid[5], board.grid[9] = 'X', 'X', 'X'
      expect(victory_checker.diagonal_win(board.grid)).to eq 'X'
    end

    it "should return 'O' if any column has all O's" do
      board.grid[3], board.grid[5], board.grid[7] = 'O', 'O', 'O'
      expect(victory_checker.diagonal_win(board.grid)).to eq 'O'
    end

    it "should return nil if there are no vertical wins" do
      board.grid[1], board.grid[9] = 'O', 'O'
      expect(victory_checker.diagonal_win(board.grid)).to be_nil
    end
  end
end