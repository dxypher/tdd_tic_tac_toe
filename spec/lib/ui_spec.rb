require 'spec_helper'

describe UI do
  before(:each) do
    @board = double('board', 'grid' => {1 => ' ', 2 => ' ', 3 => 'human',
                                       4 => ' ', 5 => ' ', 6 => ' ',
                                       7 => 'computer', 8 => ' ', 9 => ' '})
  end
  describe '#print_board' do
    it "should print the current board to the console" do
      ui = UI.new('human')
      expected = "      |     |  #{ui.human_mark}\n  _______________\n      |     |   \n  _______________\n   #{ui.computer_mark}  |     |   \n\n"
      output = capture_stdout { ui.print_board(@board.grid) }
      expect(output).to eq expected
    end
  end

  describe '#set_board_marks' do
    let(:ui) { UI.new('computer') }
    it "should set a spot owned by the computer with the computer_mark" do
      new_grid = ui.set_board_marks(@board.grid)
      expect(new_grid[7]).to eq ui.computer_mark
    end

    it "should set a spot owned by the human player with the human_mark" do
      new_grid = ui.set_board_marks(@board.grid)
      expect(new_grid[3]).to eq ui.human_mark
    end
  end
end

def capture_stdout(&block)
  original_stdout = $stdout
  $stdout = fake = StringIO.new
  begin
    yield
  ensure
    $stdout = original_stdout
  end
  fake.string
end