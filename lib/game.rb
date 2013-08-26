class Game
  attr_reader :board, :first_player
  def initialize
    @board = Board.new
    @first_player = first_player
    @human = Human.new(@first_player)
    @computer = Computer.new(@first_player)
  end

  def play
    player = current_player
    position = get_move_from(player)
    mark = get_mark(player)
    @board.make_move(position, mark)
    puts @board.grid
  end

  def first_player
    first_player = ['computer', 'human'].sample
  end

  def get_mark(current_player)
    current_player.mark
  end

  def current_player(last_player=nil)
    if last_player.nil?
      @first_player == 'human' ? @human : @computer
    else
      last_player.class == Human ? @computer : @human
    end
  end

  def get_move_from(the_current_player)
    puts "Choose your next move..."
    move = the_current_player.get_next_move
    if !(1..9).include?(move)
      puts "Sorry, please enter a valid box number between 1 and 9."
      get_move_from(the_current_player)
    elsif @board.grid[move] != ' '
      puts "Sorry, that box is already filled."
      get_move_from(the_current_player)
    else
      move
    end
  end
end