require 'bundler'
Bundler.require

require_relative 'board.rb'
require_relative 'player.rb'

class Game
 attr_accessor :board, :players, :match_nb

  def initialize
  @board = Board.new
  @players = Player.create_players
  @match_nb = 0
  end

  def play
    system "clear"
    Player.show_players_begin
    while !@board.victoire? && @board.coups_joues < 9
        Player.all.each do |player|
          if !@board.victoire? && @board.coups_joues < 9
            puts "il sagit du tour n° #{@board.coups_joues} du match n° #{@match_nb}"
            player.player_plays(@board)
          end
        end
    end
    @board.show_board
    @board.show_winner
    rematch?
  end

  def rematch?
    choice = 0
    while choice != "Y" && choice != "N"
      puts "Souhaitez-vous recommencer (Y/N) ?"
      choice = gets.chomp
    end
    if choice == "Y"
      puts "Messieurs-Dames sont joueurs ! Très bien, vous l'aurez voulu."
      @match_nb += 1
      @board = Board.new
      play
    else 
      puts "Tant mieux car c'est vraiment un jeu de merde lol."
    end
  end


end
