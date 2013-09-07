require 'spec_helper'

describe UI do
  before(:each) do
    # COMPUTER_MARK = 'X'
    # HUMAN_MARK = 'O'
    @board = double('board', 'grid' => {1 => ' ', 2 => ' ', 3 => 'human',
                                       4 => ' ', 5 => ' ', 6 => ' ',
                                       7 => 'computer', 8 => ' ', 9 => ' '})
  end
  describe '#print_board' do
    it "should print the current board to the console" do
      ui = UI.new
      expected = "      |     |  #{HUMAN_MARK}\n  _______________\n      |     |   \n  _______________\n   #{COMPUTER_MARK}  |     |   \n\n"
      output = capture_stdout { ui.print_board(@board.grid) }
      expect(output).to eq expected
    end
  end

  describe '#set_board_marks' do
    it "should set a spot owned by the computer with the COMPUTER_MARK" do
      ui = UI.new
      new_grid = ui.set_board_marks(@board.grid)
      expect(new_grid[7]).to eq COMPUTER_MARK
    end

    it "should set a spot owned by the human player with the HUMAN_MARK" do
      ui = UI.new
      new_grid = ui.set_board_marks(@board.grid)
      expect(new_grid[3]).to eq HUMAN_MARK
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