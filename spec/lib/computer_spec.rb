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
end