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
      board.grid[4], board.grid[5] = 'human', 'human'
      victory_checker.check_for_win(board.grid)
      expect(victory_checker.state).to be_nil
    end

    it "should return 'computer' if any column is owned by the computer" do
      board.grid[2], board.grid[5], board.grid[8] = 'computer', 'computer', 'computer'
      victory_checker.check_for_win(board.grid)
      expect(victory_checker.state).to eq 'Computer Wins!'
    end

    it "should return 'human' if any column is owned by the human player" do
      board.grid[1], board.grid[4], board.grid[7] = 'human', 'human', 'human'
      victory_checker.check_for_win(board.grid)
      expect(victory_checker.state).to eq 'Human Wins!'
    end

    it "should return nil if there are no vertical wins" do
      board.grid[1], board.grid[7] = 'computer', 'computer'
      victory_checker.check_for_win(board.grid)
      expect(victory_checker.state).to be_nil
    end

    it "should return 'computer' if any diagonal is owned by the computer" do
      board.grid[1], board.grid[5], board.grid[9] = 'computer', 'computer', 'computer'
      victory_checker.check_for_win(board.grid)
      expect(victory_checker.state).to eq 'Computer Wins!'
    end

    it "should return 'human' if any diagonal is owned by the human player" do
      board.grid[3], board.grid[5], board.grid[7] = 'human', 'human', 'human'
      victory_checker.check_for_win(board.grid)
      expect(victory_checker.state).to eq 'Human Wins!'
    end

    it "should return nil if there are no vertical wins" do
      board.grid[1], board.grid[9] = 'human', 'human'
      victory_checker.check_for_win(board.grid)
      expect(victory_checker.state).to be_nil
    end

    context "stalemate" do
      it "should return 'Game is a Stalemate' if no one wins and all spaces are filled" do
        board = double('board', 'grid' => {1 => 'human', 2 => 'computer', 3 => 'human',
                                           4 => 'human', 5 => 'computer', 6 => 'computer',
                                           7 => 'computer', 8 => 'human', 9 => 'human'})
        victory_checker.check_for_win(board.grid)
        expect(victory_checker.state).to eq 'Game is a Stalemate'
      end
    end
  end
end