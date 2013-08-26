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