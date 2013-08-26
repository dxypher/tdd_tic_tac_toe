Dir["./lib/*.rb"].each {|file| require file }
game = Game.new
game.print_game_instructions
game.play






