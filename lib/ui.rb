class UI
  def print_board(grid)
    puts ["   #{grid[1]}  |  #{grid[2]}  |  #{grid[3]}", 
          "  _______________", 
          "   #{grid[4]}  |  #{grid[5]}  |  #{grid[6]}",
          "  _______________",
          "   #{grid[7]}  |  #{grid[8]}  |  #{grid[9]}","\n"]
  end
end