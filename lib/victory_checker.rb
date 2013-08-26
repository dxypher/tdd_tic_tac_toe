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
end