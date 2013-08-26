class VictoryChecker
  THREE_CONSECUTIVE_Xs = ['X','X','X']
  THREE_CONSECUTIVE_Os = ['O','O','O']

  def horizontal_win(grid)
    top = grid.values_at(1, 2, 3)
    mid = grid.values_at(4, 5, 6)
    bottom = grid.values_at(7, 8, 9)

    return 'X' if [top, mid, bottom].include?(THREE_CONSECUTIVE_Xs)
    return 'O' if [top, mid, bottom].include?(THREE_CONSECUTIVE_Os)
  end

  def vertical_win(grid)
    left = grid.values_at(1, 4, 7)
    mid = grid.values_at(2, 5, 8)
    right = grid.values_at(3, 6, 9)

    return 'X' if [left, mid, right].include?(THREE_CONSECUTIVE_Xs)
    return 'O' if [left, mid, right].include?(THREE_CONSECUTIVE_Os)
  end

  def diagonal_win(grid)
    left_across = grid.values_at(1, 5, 9)
    right_across = grid.values_at(3, 5, 7)

    return 'X' if [left_across, right_across].include?(THREE_CONSECUTIVE_Xs)
    return 'O' if [left_across, right_across].include?(THREE_CONSECUTIVE_Os)
  end
end