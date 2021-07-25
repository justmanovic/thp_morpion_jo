require 'bundler'
Bundler.require

require_relative 'board.rb'
require_relative 'partie.rb'
require_relative 'player.rb'

class Case
 attr_accessor :position, :contenu 
 @@cases_all = []

  def initialize(position)
    @position = position
    @contenu = [" "," "] #symbol, joueur
    @@cases_all << self
  end

 def self.all
  return @@cases_all
 end
end




