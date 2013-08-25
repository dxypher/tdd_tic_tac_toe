require 'spec_helper'
require 'ttt'

describe Game, '.new' do
  it "initializes an empty board" do
    game = Game.new
    board = {1 => ' ', 2 => ' ', 3 => ' ',
             4 => ' ', 5 => ' ', 6 => ' ',
             7 => ' ', 8 => ' ', 9 => ' '}
    expect(game.board).to eq board
  end
end