class Game
  attr_reader :board, :first_player
  def initialize
    @board = Board.new
    @first_player = first_player
    @human = Human.new(@first_player)
    @computer = Computer.new(@first_player)
    @ui = UI.new
  end

  def play
    player = current_player(@last_player)
    position = get_move_from(player)
    mark = player.mark
    @board.make_move(position, mark)
    @ui.print_board(@board.grid)
    play
  end

  def first_player
    first_player = ['computer', 'human'].sample
  end

  def current_player(last_player=nil)
    if last_player.nil?
      player = @first_player == 'human' ? @human : @computer
      @last_player = player
      player
    else
      player = last_player.class == Human ? @computer : @human
      @last_player = player
      player
    end
  end

  def get_move_from(the_current_player)
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

  def print_game_instructions
    puts "Welcome to Tic-Tac-Toe..."
    puts "To make a move select a number between 1 and 9 that corresponds"
    puts "to the box where you want your move to go."

    puts "    1  |  2  |  3 "
    puts "  _________________"
    puts "    4  |  5  |  6 "
    puts "  _________________"
    puts "    7  |  8  |  9 "

    message = @first_player == 'computer' ? "Computer goes first and is 'X'." : "You go first and are 'X'."
    puts message
  end
end