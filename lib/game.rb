class Game
  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new(@first_player)
    @ui = UI.new
    @victory_checker = VictoryChecker.new
    print_game_instructions
  end

  def play
    while !announce_end_game?(@victory_checker)
      player = current_player(@last_player)
      position = get_move_from(player, @board.grid)
      mark = player.mark
      @board.make_move(position, mark)
      @ui.print_board(@board.grid)
    end
      exit
  end

  def announce_end_game?(victory_checker)
    if victory_checker.check_for_win(@board.grid)
      puts victory_checker.state
      return true
    else
      return false
    end
  end


  def current_player(last_player=nil)
    if last_player.nil?
      player = @first_player == 'human' ? @human : @computer
    else
      player = last_player.class == Human ? @computer : @human
    end
    @last_player = player
    player
  end

  def get_move_from(the_current_player, grid)
    move = the_current_player.get_next_move(grid)
    if !(1..9).include?(move)
      puts "Sorry, please enter a valid box number between 1 and 9."
      get_move_from(the_current_player, grid)
    elsif @board.grid[move] != ' '
      puts "Sorry, that box is already filled."
      get_move_from(the_current_player, grid)
    else
      move
    end
  end

  def first_player
    first_player = ['computer', 'human'].sample
  end

  def print_game_instructions
    player_one = first_player
    puts "Welcome to Tic-Tac-Toe..."
    puts "To make a move select a number between 1 and 9 that corresponds"
    puts "to the box where you want your move to go."

    puts "    1  |  2  |  3 "
    puts "  _________________"
    puts "    4  |  5  |  6 "
    puts "  _________________"
    puts "    7  |  8  |  9 "

    message = player_one == 'computer' ? "Computer goes first." : "You go first."
    puts message
  end
end