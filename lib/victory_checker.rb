class VictoryChecker
  THREE_CONSECUTIVE_Xs = ['X','X','X']
  THREE_CONSECUTIVE_Os = ['O','O','O']

  def check_for_win(grid)
    combinations = winning_combinations(grid)
    return 'X' if combinations.include?(THREE_CONSECUTIVE_Xs)
    return 'O' if combinations.include?(THREE_CONSECUTIVE_Os)
    return 'Game is a Stalemate' if !combinations.flatten.include?(' ')
  end

  def winning_combinations(grid)
    top = grid.values_at(1, 2, 3)
    middle_row = grid.values_at(4, 5, 6)
    bottom = grid.values_at(7, 8, 9)
    left = grid.values_at(1, 4, 7)
    middle_column = grid.values_at(2, 5, 8)
    right = grid.values_at(3, 6, 9)
    left_across = grid.values_at(1, 5, 9)
    right_across = grid.values_at(3, 5, 7)

    [top, middle_row, bottom, left, middle_column, right, left_across, right_across]
  end
end