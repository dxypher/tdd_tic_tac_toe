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
      last_player = 'human'
      expect(game.current_player(last_player)).to eq 'computer'
    end

    it "should return human if last move was made by computer" do
      last_player = 'computer'
      expect(game.current_player(last_player)).to eq 'human'
    end
  end
end
