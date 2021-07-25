require 'bundler'
Bundler.require

require_relative 'lib/app/board'
require_relative 'lib/app/partie'
require_relative 'lib/app/player'
require_relative 'lib/app/board_case'


# new_game = Game.new



#------------------------OK------------------------------------------------------------

# =begin
# Player.create_players
# Player.show_players_begin(Player.all[0], Player.all[1]) 

# player1 = Player.new
# player1.name = 'Jo'
# player1.symbol = '💋'
# puts player1
# player2 = Player.new
# player2.name = 'Ary'
# player2.symbol = "💥"

game = Game.new
game.play

# =end 

#----------------------PAS OK--------------------------------------------------------------
# p Case.all


