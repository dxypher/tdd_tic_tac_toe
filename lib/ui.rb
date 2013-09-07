class UI
  attr_reader :computer_mark, :human_mark

  def initialize(first_player)
    @computer_mark = first_player == 'computer' ? FIRST_PLAYER_MARK : SECOND_PLAYER_MARK
    @human_mark = first_player == 'human' ? FIRST_PLAYER_MARK : SECOND_PLAYER_MARK
  end

  def print_board(grid)
    new_grid = grid.clone
    set_board_marks(new_grid)
    puts ["   #{new_grid[1]}  |  #{new_grid[2]}  |  #{new_grid[3]}", 
          "  _______________", 
          "   #{new_grid[4]}  |  #{new_grid[5]}  |  #{new_grid[6]}",
          "  _______________",
          "   #{new_grid[7]}  |  #{new_grid[8]}  |  #{new_grid[9]}","\n"]
  end

  def set_board_marks(new_grid)
    new_grid.each do |key, value|
      if value == 'computer'
        new_grid[key] = @computer_mark
      elsif value == 'human'
        new_grid[key] = @human_mark
      end
    end
  end
end