class Computer
  attr_reader :mark
  def initialize(first_player)
    @mark = set_mark(first_player)
  end

  def set_mark(first_player)
    first_player == 'computer' ? 'X' : 'O'
  end

  def get_next_move
    1
  end

  def make_winning_move(grid)
    get_game_ending_move(grid, @mark)
  end

  def make_blocking_move(grid)
    mark = @mark == 'X' ? 'O' : 'X'
    get_game_ending_move(grid, mark)
  end

  def get_game_ending_move(grid, mark)
    collection = possible_wins(grid)
    collection.each do |row|
      values = row.map {|box| box[1]}
      if values.count(mark) == 2 && values.count(' ') == 1
        i = row.reject {|box| box[1] != ' ' }
        return i.first.first
      end
    end
    return nil
  end

  def make_regular_move(grid)
    corners = [grid[1], grid[3], grid[7], grid[9]]
    if corners.count(' ') == 4
      return 1
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