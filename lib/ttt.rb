class Game
  attr_reader :board
  def initialize
    @board = {1 => ' ', 2 => ' ', 3 => ' ',
              4 => ' ', 5 => ' ', 6 => ' ',
              7 => ' ', 8 => ' ', 9 => ' '}    
    @human = Human.new
    @computer = Computer.new      
  end

  def make_move(position, mark)
    @board[position] = mark
  end

  def get_mark(current_player)
    current_player == 'computer' ? 'O' : 'X'
  end

  def current_player(last_player)
    last_player.class == Human ? @computer : @human
  end

  def get_move_from(the_current_player)
    the_current_player.get_next_move
  end
end

class Human
  def get_next_move
    gets.chomp.to_i
  end
end

class Computer
  def get_next_move
    1
  end
end