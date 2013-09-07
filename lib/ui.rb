class UI
  def print_board(grid)
    new_grid = set_board_marks(grid)
    puts ["   #{new_grid[1]}  |  #{new_grid[2]}  |  #{new_grid[3]}", 
          "  _______________", 
          "   #{new_grid[4]}  |  #{new_grid[5]}  |  #{new_grid[6]}",
          "  _______________",
          "   #{new_grid[7]}  |  #{new_grid[8]}  |  #{new_grid[9]}","\n"]
  end

  def set_board_marks(grid)
    grid.each do |key, value|
      if value == 'computer'
        grid[key] = COMPUTER_MARK
      elsif value == 'human'
        grid[key] = HUMAN_MARK
      end
    end
  end
end