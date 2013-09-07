require 'spec_helper'

describe Game do
  let(:game) {Game.new}
  before do
    IO.any_instance.stub(:puts)
  end
  describe '.new' do
    it "initializes an empty board" do
      grid = {1 => ' ', 2 => ' ', 3 => ' ',
               4 => ' ', 5 => ' ', 6 => ' ',
               7 => ' ', 8 => ' ', 9 => ' '}
      board = Board.new
      expect(board.grid).to eq grid
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
    let(:board) {double('board', 'grid' => {1 => 'X', 2 => ' ', 3 => ' ',
                                            4 => ' ', 5 => 'O', 6 => ' ',
                                            7 => ' ', 8 => 'X', 9 => ' '})}
    it "should get the next move from the human player" do
      current_player = Human.new
      current_player.stub(:gets) { "7\n" }
      expect(game.get_move_from(current_player, board.grid)).to eq 7      
    end

    it "should get the next move from the computer player" do
      current_player = Computer.new('human')
      expect(game.get_move_from(current_player, board.grid)).to eq 3
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







