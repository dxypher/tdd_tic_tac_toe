class Human
  attr_reader :mark

  def initialize(first_player)
    @mark = set_mark(first_player)
  end

  def set_mark(first_player)
    first_player == 'human' ? 'X' : 'O'
  end

  def get_next_move(grid)
    puts "Choose your next move..."
    gets.chomp.to_i
  end
end