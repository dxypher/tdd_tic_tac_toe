require 'spec_helper'

describe Board do
  describe '#make_move' do
    it "mark the ownership of a given spot to the player who made the move" do
      board = Board.new
      player = Human.new
      board.make_move(3, player)
      expect(board.grid[3]).to eq 'human'
    end
  end
end