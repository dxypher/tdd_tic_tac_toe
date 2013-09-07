class Board
  attr_reader :grid
  def initialize
    @grid = {1 => ' ', 2 => ' ', 3 => ' ',
             4 => ' ', 5 => ' ', 6 => ' ',
             7 => ' ', 8 => ' ', 9 => ' '}
  end

  def make_move(position, player)
    owner = player.class == Human ? 'human' : 'computer'
    grid[position] = owner
  end
end