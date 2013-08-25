class Game
  attr_reader :board
  def initialize
    @board = {1 => ' ', 2 => ' ', 3 => ' ',
              4 => ' ', 5 => ' ', 6 => ' ',
              7 => ' ', 8 => ' ', 9 => ' '}
  end

  def make_move(position, mark)
    @board[position] = mark
  end

  def get_mark(current_player)
    current_player == 'computer' ? 'O' : 'X'
  end

  def current_player(last_player)
    last_player == 'human' ? 'computer' : 'human'
  end
end