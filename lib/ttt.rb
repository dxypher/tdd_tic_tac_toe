class Game
  attr_reader :board, :first_player
  def initialize
    @board = {1 => ' ', 2 => ' ', 3 => ' ',
              4 => ' ', 5 => ' ', 6 => ' ',
              7 => ' ', 8 => ' ', 9 => ' '}
    @first_player = first_player
    @human = Human.new(@first_player)
    @computer = Computer.new
  end

  def first_player
    first_player = ['computer', 'human'].sample
  end

  def make_move(position, mark)
    @board[position] = mark
  end

  def get_mark(current_player)
    current_player.mark
  end

  def current_player(last_player)
    last_player.class == Human ? @computer : @human
  end

  def get_move_from(the_current_player)
    the_current_player.get_next_move
  end
end

class Human
  attr_reader :mark
  def initialize(first_player)
    @mark = set_mark(first_player)
  end

  def set_mark(first_player)
    first_player == 'human' ? 'X' : 'O'
  end

  def get_next_move
    gets.chomp.to_i
  end
end

class Computer
  attr_reader :mark
  def initialize
    @mark = 'O'
  end
  def get_next_move
    1
  end
end