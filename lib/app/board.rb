require 'bundler'
Bundler.require

require_relative 'board_case.rb'
require_relative 'partie.rb'
require_relative 'player.rb'

class Board
  attr_accessor :a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3, :coups_joues

  def initialize
    @a1 = Case.new(0).contenu
    @a2 = Case.new(1).contenu
    @a3 = Case.new(2).contenu
    @b1 = Case.new(3).contenu
    @b2 = Case.new(4).contenu
    @b3 = Case.new(5).contenu
    @c1 = Case.new(6).contenu
    @c2 = Case.new(7).contenu
    @c3 = Case.new(8).contenu
    @coups_joues = 0
  end

  def victoire_line1
    (@a1!=[" ", " "] && @a1 == @a2 && @a1 == @a3) ? true : false
  end

  def victoire_line1_name
    (@a1!=[" ", " "] && @a1 == @a2 && @a1 == @a3) ? @a1  : false
  end

  def victoire_line2
    (@b1!=[" ", " "] && @b1 == @b2 && @b2 == @b3) ? true : false
  end

  def victoire_line2_name
    (@b1!=[" ", " "] && @b1 == @b2 && @b2 == @b3) ? @b1 : false
  end
  
  def victoire_line3
    (@c1!=[" ", " "] && @c1 == @c2 && @c2 == @c3) ? true : false
  end

  def victoire_line3_name
    (@c1!=[" ", " "] && @c1 == @c2 && @c2 == @c3) ? @c1 : false
  end
  
  def victoire?
   return (victoire_line1 || victoire_line2 || victoire_line3)
  end

  def victoire_name
    return (victoire_line1_name || victoire_line2_name || victoire_line3_name)
   end

  def show_board
    # puts
    # puts " "*25 + "1" + " "*6 + "2" + " "*6 + "3"
    # puts " "*20 + "  " +  " "*6 + "|" + " "*6 + "|" 
    # puts " "*20 + "A " +  " "*2 + @a1.symbol  + " "*2 + "|" + " "*2 + @a2 + " "*2 + "|" + " "*2 + @a3 
    # puts " "*20 + "  " +  " "*6 + "|" + " "*6 + "|" 
    # puts " "*20 + "  " +  "-"*20
    # puts " "*20 + "  " +  " "*6 + "|" + " "*6 + "|" 
    # puts " "*20 + "B " +  " "*2 + @b1 + " "*2 + "|" + " "*2 + @b2 + " "*2 + "|" + " "*2 + @b3 
    # puts " "*20 + "  " +  " "*6 + "|" + " "*6 + "|" 
    # puts " "*20 + "  " +  "-"*20
    # puts " "*20 + "  " +  " "*6 + "|" + " "*6 + "|" 
    # puts " "*20 + "C " +  " "*2 + @c1 + " "*2 + "|" + " "*2 + @c2 + " "*2 + "|" + " "*2 + @c3 
    # puts

    # puts "#{@a1.contenu}, #{@a2.contenu}, #{@a3.contenu}"
    # puts "#{@b1.contenu}, #{@b2.contenu}, #{@b3.contenu}"
    # puts "#{@c1.contenu}, #{@c2.contenu}, #{@c3.contenu}"

    puts "#{@a1[0]}, #{@a2[0]}, #{@a3[0]}"
    puts "#{@b1[0]}, #{@b2[0]}, #{@b3[0]}"
    puts "#{@c1[0]}, #{@c2[0]}, #{@c3[0]}"

  end

  def show_winner
    if victoire? == true
      puts "Le grand gagnant est #{victoire_name}"
    else
      puts "WoW ! Quel match de merde !"
    end
  end

end

# binding.pry