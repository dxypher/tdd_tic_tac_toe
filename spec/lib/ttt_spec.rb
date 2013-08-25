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

    it "sets who the first player will be" do
      game.should_receive(:first_player).and_return('computer')
      expect(game.first_player).to eq 'computer'
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
      computer = double('computer', 'mark' => 'O')
      current_player = computer
      expect(game.get_mark(current_player)).to eq 'O'
    end
  end

  describe '#current_player' do
    it "should return computer if last move was made by human" do
      last_player = Human.new('computer')
      expect(game.current_player(last_player)).to be_an_instance_of(Computer)
    end

    it "should return human if last move was made by computer" do
      last_player = 'computer'
      expect(game.current_player(last_player)).to be_an_instance_of(Human)
    end
  end

  describe '#get_move' do
    it "should get the next move from the human player" do
      current_player = Human.new('computer')
      current_player.stub(:gets) { "7\n" }
      expect(game.get_move_from(current_player)).to eq 7      
    end

    it "should get the next move from the computer player" do
      current_player = Computer.new
      expect(game.get_move_from(current_player)).to eq 1
    end
  end

  describe '.first_player' do
    it "should choose at random which player will go first" do
      result = []
      20.times do
        result << game.first_player
      end
      result.count('computer').should be > 0
      result.count('computer').should_not eq 20
    end
  end
end







