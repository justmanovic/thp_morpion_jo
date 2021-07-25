require 'bundler'
Bundler.require

require_relative 'board'
require_relative 'partie'
require_relative 'board_case'

class Player
  attr_accessor :name, :symbol, :num_joueur
  @@players_tab = []
  @@symbol_tab = ["💋","🍑", "🍆", "👁", "🖕"]

  def initialize(num_joueur)
    @name = ""
    @num_joueur = num_joueur
    @symbol = ""
    @compteur_victoire = 0
    @@players_tab << self
  end

  def register_name
    puts "Joueur-#{@num_joueur}, quel est ton nom ?"
    print " >> "
    @name = gets.chomp
  end

  def register_symbol
    choice = -1
    while choice < 0 || choice > @@symbol_tab.length || choice.class != Integer
      puts "D'accord, #{@name}. Quel symbole choisis-tu ?"
      for i in 1..@@symbol_tab.length
        puts "Tapes #{i} pour #{@@symbol_tab[i-1]}"
      end
      print " >> "
      choice = gets.chomp.to_i
      @symbol = @@symbol_tab[choice - 1]
      @@symbol_tab.delete_at(choice - 1)
      puts
    end
  end

  def play(board) 
    new_move = " "
    while !["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"].include? new_move
      puts "#{@name}, où souhaites-tu jouer ?"
      new_move = gets.chomp
      case new_move
      when "A1"
        board.a1 = [@symbol,@name]
        board.coups_joues +=1
      when "A2"
        board.a2 = [@symbol,@name]
        board.coups_joues +=1
      when "A3"
        board.a3 = [@symbol,@name]
        board.coups_joues +=1
      when "B1"
        board.b1 = [@symbol,@name]
        board.coups_joues +=1

      when "B2"
        board.b2 = [@symbol,@name]
        board.coups_joues +=1

      when "B3"
        board.b3 = [@symbol,@name]
        board.coups_joues +=1

      when "C1"
        board.c1 = [@symbol,@name]
        board.coups_joues +=1

      when "C2"
        board.c2 = [@symbol,@name]
        board.coups_joues +=1

      when "C3"
        board.c3= [@symbol,@name]
        board.coups_joues +=1

      else
        puts "Réfléchis un peu bon sang de bon soir ! Je te laisse une nouvelle chances..."
      end
    end
  end

  def player_plays(board)
    board.show_board
    play(board)
    sleep(0.5)
    system "clear"
  end

  def self.create_players
    player1 = Player.new(1)
    player2 = Player.new(2)
    [player1, player2].each do |player|
      player.register_name
      player.register_symbol
    end
  end

  def self.all
    return @@players_tab
  end

  def self.nb_coups
    return @@coups_joues
  end

  def self.show_players_begin
    puts "Nous avons en jeu : \n- #{@@players_tab[0].name} (#{@@players_tab[0].symbol})\n- #{@@players_tab[1].name} (#{@@players_tab[1].symbol})"
  end
end