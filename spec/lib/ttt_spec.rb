require 'spec_helper'
require 'ttt'

describe Game do
  let(:game) {Game.new}
  describe '.new' do
    it "initializes an empty board" do
      board = {1 => ' ', 2 => ' ', 3 => ' ',
               4 => ' ', 5 => ' ', 6 => ' ',
               7 => ' ', 8 => ' ', 9 => ' '}
      expect(game.board).to eq board
    end
  end

  describe '#make_move' do
    it "places the given mark at the specified position on the board" do
      game.make_move(3, 'X')
      expect(game.board[3]).to eq 'X'
    end
  end

  describe '#get_mark' do
    it "should get the mark of the current player" do
      current_player = 'computer'
      expect(game.get_mark(current_player)).to eq 'O'
    end
  end

  describe '#current_player' do
    it "should return computer if last move was made by human" do
      last_player = Human.new
      
      expect(game.current_player(last_player)).to be_an_instance_of(Computer)
    end

    it "should return human if last move was made by computer" do
      last_player = 'computer'
      expect(game.current_player(last_player)).to be_an_instance_of(Human)
    end
  end

  describe '#get_move' do
    it "should get the next move from the human player" do
      current_player = Human.new
      current_player.stub(:gets) { "7\n" }
      expect(game.get_move_from(current_player)).to eq 7      
    end

    it "should get the next move from the computer player" do
      current_player = Computer.new
      expect(game.get_move_from(current_player)).to eq 1
    end
  end
end
