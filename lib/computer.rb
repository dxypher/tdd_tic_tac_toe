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
end