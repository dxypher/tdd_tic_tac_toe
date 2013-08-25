class Game
  attr_reader :board, :first_player
  def initialize
    @board = {1 => ' ', 2 => ' ', 3 => ' ',
              4 => ' ', 5 => ' ', 6 => ' ',
              7 => ' ', 8 => ' ', 9 => ' '}
    @first_player = first_player
    @human = Human.new(@first_player)
    @computer = Computer.new(@first_player)
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
    puts "Choose your next move..."
    move = the_current_player.get_next_move
    if !(1..9).include?(move)
      puts "Sorry, please enter a valid box number between 1 and 9."
      get_move_from(the_current_player)
    elsif @board[move] != ' '
      puts "Sorry, that box is already filled."
      get_move_from(the_current_player)
    else
      move
    end
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
  def initialize(first_player)
    @mark = set_mark(first_player)
  end

  def set_mark(first_player)
    first_player == 'computer' ? 'X' : 'O'
  end

  def get_next_move
    1
  end
end