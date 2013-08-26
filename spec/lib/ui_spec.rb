require 'spec_helper'
require 'ui'

describe UI do
  describe '#print_board' do
    it "should print the current board to the console" do
      ui = UI.new
      board = double('board', 'grid' => {1 => ' ', 2 => ' ', 3 => ' ',
                                       4 => ' ', 5 => ' ', 6 => ' ',
                                       7 => 'X', 8 => ' ', 9 => ' '})
      expected = "      |     |   \n  _______________\n      |     |   \n  _______________\n   X  |     |   \n"
      output = capture_stdout { ui.print_board(board.grid) }
      expect(output).to eq expected
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