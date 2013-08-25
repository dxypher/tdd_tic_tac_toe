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
      current_player = stub('current_player', 'mark' => 'O')
      expect(game.get_mark(current_player)).to eq 'O'
    end
  end
end
