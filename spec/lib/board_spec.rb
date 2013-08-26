require 'spec_helper'
require 'board'

describe Board do
  describe '#make_move' do
    it "places the given mark at the specified position on the board" do
      board = Board.new
      board.make_move(3, 'X')
      expect(board.grid[3]).to eq 'X'
    end
  end
end