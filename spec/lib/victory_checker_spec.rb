require 'spec_helper'

describe VictoryChecker do
  let(:board) {board = double('board', 'grid' => {1 => ' ', 2 => ' ', 3 => ' ',
                                                  4 => ' ', 5 => ' ', 6 => ' ',
                                                  7 => ' ', 8 => ' ', 9 => ' '})}
  let(:victory_checker) { VictoryChecker.new }

  describe '#check_for_win' do
    it "should return 'computer' if any row is owned entirely by the computer" do
      board.grid[7], board.grid[8], board.grid[9] = 'computer', 'computer', 'computer'
      victory_checker.check_for_win(board.grid)
      expect(victory_checker.state).to eq 'Computer Wins!'
    end

    it "should return 'human' if any row is owned entirely by the human player" do
      board.grid[4], board.grid[5], board.grid[6] = 'human', 'human', 'human'
      victory_checker.check_for_win(board.grid)
      expect(victory_checker.state).to eq 'Human Wins!'
    end

    it "should return nil if there are no horizontal wins" do
      pending
      board.grid[4], board.grid[5] = 'O', 'O'
      victory_checker.check_for_win(board.grid)
      expect(victory_checker.state).to be_nil
    end

    it "should return 'X' if any column has all X's" do
      pending
      board.grid[2], board.grid[5], board.grid[8] = 'X', 'X', 'X'
      victory_checker.check_for_win(board.grid)
      expect(victory_checker.state).to eq 'X Wins!'
    end

    it "should return 'O' if any column has all O's" do
      pending
      board.grid[1], board.grid[4], board.grid[7] = 'O', 'O', 'O'
      victory_checker.check_for_win(board.grid)
      expect(victory_checker.state).to eq 'O Wins!'
    end

    it "should return nil if there are no vertical wins" do
      pending
      board.grid[1], board.grid[7] = 'O', 'O'
      victory_checker.check_for_win(board.grid)
      expect(victory_checker.state).to be_nil
    end

    it "should return 'X' if any column has all X's" do
      pending
      board.grid[1], board.grid[5], board.grid[9] = 'X', 'X', 'X'
      victory_checker.check_for_win(board.grid)
      expect(victory_checker.state).to eq 'X Wins!'
    end

    it "should return 'O' if any column has all O's" do
      pending
      board.grid[3], board.grid[5], board.grid[7] = 'O', 'O', 'O'
      victory_checker.check_for_win(board.grid)
      expect(victory_checker.state).to eq 'O Wins!'
    end

    it "should return nil if there are no vertical wins" do
      pending
      board.grid[1], board.grid[9] = 'O', 'O'
      victory_checker.check_for_win(board.grid)
      expect(victory_checker.state).to be_nil
    end

    context "stalemate" do
      it "should return 'Game is a Stalemate' if no one wins and all spaces are filled" do
        pending
        board = double('board', 'grid' => {1 => 'X', 2 => 'O', 3 => 'X',
                                           4 => 'X', 5 => 'O', 6 => 'O',
                                           7 => 'O', 8 => 'X', 9 => 'X'})
        victory_checker.check_for_win(board.grid)
        expect(victory_checker.state).to eq 'Game is a Stalemate'
      end
    end
  end
end