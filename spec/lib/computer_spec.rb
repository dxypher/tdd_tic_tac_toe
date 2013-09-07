require 'spec_helper'

describe Computer do
  describe '#make_winning_move' do
    it "should make next move the empty position if it would make three consecutive computer marks" do
      computer = Computer.new
      board = double('board', 'grid' => {1 => 'computer', 2 => 'computer', 3 => ' ',
                                         4 => 'human', 5 => 'human', 6 => ' ',
                                         7 => ' ', 8 => ' ', 9 => ' '})
      expect(computer.make_winning_move(board.grid)).to eq 3
    end

    it "should make next move the empty position if it would make three consecutive computer marks" do
      computer = Computer.new
      board = double('board', 'grid' => {1 => 'computer', 2 => 'human', 3 => ' ',
                                         4 => 'human', 5 => 'computer', 6 => ' ',
                                         7 => ' ', 8 => ' ', 9 => ' '})
      expect(computer.make_winning_move(board.grid)).to eq 9
    end

    it "should make next move the empty position if it would make three consecutive computer marks" do
      computer = Computer.new
      board = double('board', 'grid' => {1 => 'human', 2 => 'computer', 3 => 'human',
                                         4 => ' ', 5 => 'computer', 6 => 'human',
                                         7 => ' ', 8 => ' ', 9 => ' '})
      expect(computer.make_winning_move(board.grid)).to eq 8
    end

    it "should return nil if no winning move is possible" do
      computer = Computer.new
      board = double('board', 'grid' => {1 => 'human', 2 => 'computer', 3 => 'human',
                                         4 => ' ', 5 => ' ', 6 => ' ',
                                         7 => ' ', 8 => 'human', 9 => 'computer'})
      expect(computer.make_winning_move(board.grid)).to be_nil
    end
  end

  describe '#make_blocking_move' do
    it 'should make next move the empty position if it would prevent three consecutive human marks' do
      pending
      computer = Computer.new('computer')
      board = double('board', 'grid' => {1 => 'X', 2 => ' ', 3 => 'O',
                                         4 => ' ', 5 => 'O', 6 => ' ',
                                         7 => ' ', 8 => ' ', 9 => 'X'})
      expect(computer.make_blocking_move(board.grid)).to eq 7
    end

    it 'should make next move the empty position if it would prevent three consecutive human marks' do
      pending
      computer = Computer.new('human')
      board = double('board', 'grid' => {1 => 'X', 2 => 'X', 3 => 'O',
                                         4 => 'O', 5 => ' ', 6 => ' ',
                                         7 => ' ', 8 => 'X', 9 => ' '})
      expect(computer.make_blocking_move(board.grid)).to eq 5
    end
  end

  describe '#make_regular_move' do
    let(:computer) {Computer.new('human')}
    it "chooses a corner if all the corners are still empty" do
      pending
      board = double('board', 'grid' => {1 => ' ', 2 => ' ', 3 => ' ',
                                         4 => 'X', 5 => ' ', 6 => ' ',
                                         7 => ' ', 8 => ' ', 9 => ' '})
      expect(computer.make_regular_move(board.grid)).to eq 1
    end

    it "chooses center box if it's still blank and all corners are not blank" do
      pending
      board = double('board', 'grid' => {1 => 'X', 2 => ' ', 3 => ' ',
                                         4 => ' ', 5 => ' ', 6 => ' ',
                                         7 => ' ', 8 => ' ', 9 => ' '})
      expect(computer.make_regular_move(board.grid)).to eq 5
    end

    it "chooses a blank corner if the center position is taken" do
      pending
      board = double('board', 'grid' => {1 => 'X', 2 => ' ', 3 => ' ',
                                         4 => ' ', 5 => 'O', 6 => ' ',
                                         7 => ' ', 8 => 'X', 9 => ' '})
      expect(computer.make_regular_move(board.grid)).to eq 3
    end

    it "chooses a middle box if no corners remain blank" do
      pending
      board = double('board', 'grid' => {1 => 'X', 2 => 'O', 3 => 'X',
                                         4 => ' ', 5 => 'O', 6 => 'O',
                                         7 => 'O', 8 => 'X', 9 => 'X'})
      expect(computer.make_regular_move(board.grid)).to eq 4
    end
  end
end