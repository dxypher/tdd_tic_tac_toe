# human's ownership a spot on the board is alwasy represented by a 1.
class Human
  def get_next_move(grid)
    puts "Choose your next move..."
    gets.chomp.to_i
  end
end