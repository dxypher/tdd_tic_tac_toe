class Computer
  def get_next_move(grid)
    make_winning_move(grid) || make_blocking_move(grid) || make_regular_move(grid)
  end

  def make_winning_move(grid)
    get_game_ending_move(grid, 'computer')
  end

  def make_blocking_move(grid)
    get_game_ending_move(grid, 'human')
  end

  def get_game_ending_move(grid, player)
    collection = possible_wins(grid)
    collection.each do |row|
      values = row.map {|box| box[1]}
      if values.count(player) == 2 && values.count(' ') == 1
        i = row.reject {|box| box[1] != ' ' }
        return i.first.first
      end
    end
    return nil
  end

  def make_regular_move(grid)
    corners = [grid[1], grid[3], grid[7], grid[9]]
    middles = [grid[2], grid[4], grid[6], grid[8]]
    if corners.count(' ') == 4
      return 1
    elsif grid[5] == ' '
      return 5
    elsif corners.count(' ') > 0
      make_corner_move(corners)
    else
      make_middle_move(middles)
    end
  end

  def make_corner_move(corners)
    corners.each_with_index do |value, idx|
      return [1,3,7,9][idx] if value == ' '
    end
  end

  def make_middle_move(middles)
    middles.each_with_index do |value, idx|
      return [2,4,6,8][idx] if value == ' '
    end
  end

  def possible_wins(grid)
    array = grid.to_a

    top = [array[0], array[1], array[2]]
    middle_row = [array[3], array[4], array[5]]
    bottom = [array[6], array[7], array[8]]
    left = [array[0], array[3], array[6]]
    middle_column = [array[1], array[4], array[7]]
    right = [array[2], array[5], array[8]]
    left_across = [array[0], array[4], array[8]]
    right_across = [array[2], array[4], array[6]]

    [top, middle_row, bottom, left, middle_column, right, left_across, right_across]
  end
end