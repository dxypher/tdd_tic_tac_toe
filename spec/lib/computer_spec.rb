require 'spec_helper'
require 'computer'

describe Computer do
  describe '.new' do
    it "sets the Computer players mark as 'X' if computer is first player" do
      game = double('game', 'first_player' => 'computer')
      computer = Computer.new(game.first_player)
      expect(computer.mark).to eq 'X'
    end

    it "sets the Computer players mark to 'O' if human is first player`" do
      game = double('game', 'first_player' => 'human')
      computer = Computer.new(game.first_player)
      expect(computer.mark).to eq 'O'
    end
  end

  describe '#make_winning_move' do
    it "should make next move the empty position if it would make three consecutive computer marks" do
      computer = Computer.new('computer')
      board = double('board', 'grid' => {1 => 'X', 2 => 'X', 3 => ' ',
                                         4 => 'O', 5 => 'O', 6 => ' ',
                                         7 => ' ', 8 => ' ', 9 => ' '})
      expect(computer.make_winning_move(board.grid)).to eq 3
    end

    it "should make next move the empty position if it would make three consecutive computer marks" do
      computer = Computer.new('computer')
      board = double('board', 'grid' => {1 => 'X', 2 => 'O', 3 => ' ',
                                         4 => 'O', 5 => 'X', 6 => ' ',
                                         7 => ' ', 8 => ' ', 9 => ' '})
      expect(computer.make_winning_move(board.grid)).to eq 9
    end

    it "should make next move the empty position if it would make three consecutive computer marks" do
      computer = Computer.new('human')
      board = double('board', 'grid' => {1 => 'X', 2 => 'O', 3 => 'X',
                                         4 => ' ', 5 => 'O', 6 => 'X',
                                         7 => ' ', 8 => ' ', 9 => ' '})
      expect(computer.make_winning_move(board.grid)).to eq 8
    end

    it "should return nil if no winning move is possible" do
      computer = Computer.new('human')
      board = double('board', 'grid' => {1 => 'X', 2 => 'O', 3 => 'X',
                                         4 => ' ', 5 => ' ', 6 => ' ',
                                         7 => ' ', 8 => 'X', 9 => 'O'})
      expect(computer.make_winning_move(board.grid)).to be_nil
    end
  end

  describe '#make_blocking_move' do
    it 'should make next move the empty position if it would prevent three consecutive human marks' do
      computer = Computer.new('computer')
      board = double('board', 'grid' => {1 => 'X', 2 => ' ', 3 => 'O',
                                         4 => ' ', 5 => 'O', 6 => ' ',
                                         7 => ' ', 8 => ' ', 9 => 'X'})
      expect(computer.make_blocking_move(board.grid)).to eq 7
    end

    it 'should make next move the empty position if it would prevent three consecutive human marks' do
      computer = Computer.new('human')
      board = double('board', 'grid' => {1 => 'X', 2 => 'X', 3 => 'O',
                                         4 => 'O', 5 => ' ', 6 => ' ',
                                         7 => ' ', 8 => 'X', 9 => ' '})
      expect(computer.make_blocking_move(board.grid)).to eq 5
    end
  end

  describe '#make_regular_move' do
    it "chooses a corner if all the corners are still empty" do
      computer = Computer.new('human')
      board = double('board', 'grid' => {1 => ' ', 2 => ' ', 3 => ' ',
                                         4 => 'X', 5 => ' ', 6 => ' ',
                                         7 => ' ', 8 => ' ', 9 => ' '})
      expect(computer.make_regular_move(board.grid)).to eq 1
    end

    it "chooses center box if it's still blank and all corners are not blank" do
      computer = Computer.new('human')
      board = double('board', 'grid' => {1 => 'X', 2 => ' ', 3 => ' ',
                                         4 => ' ', 5 => ' ', 6 => ' ',
                                         7 => ' ', 8 => ' ', 9 => ' '})
      expect(computer.make_regular_move(board.grid)).to eq 5
    end
  end
end