require 'spec_helper'
require 'ttt'

describe Human do
  describe '.new' do
    it "sets mark to 'X' if first player is human" do
      game = double('game', 'first_player' => 'human')
      human = Human.new(game.first_player)
      expect(human.mark).to eq 'X'
    end

    it "sets mark to 'O' if first player is computer" do
      game = double('game', 'first_player' => 'computer')
      human = Human.new(game.first_player)
      expect(human.mark).to eq 'O'
    end
  end
end