class Board
  attr_reader :grid
  def initialize
    @grid = {1 => ' ', 2 => ' ', 3 => ' ',
             4 => ' ', 5 => ' ', 6 => ' ',
             7 => ' ', 8 => ' ', 9 => ' '}
  end

  def make_move(position, mark)
    grid[position] = mark
  end
end