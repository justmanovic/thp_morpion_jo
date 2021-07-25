require 'bundler'
Bundler.require

# require_relative 'board'
# require_relative 'partie'
# require_relative 'player'

# Les require relative et bundler son plus haut :)
class Casex
 attr_accessor :position, :contenu
 @@cases_all = []

 def initialize(position)
  # @position = position
  @contenu = nil
  @@cases_all << self
 end

#  def self.create_cases
#   Casex.new(0) # je ne crée qu'une seule case pour le test
#  end

 def self.all
  return @@cases_all
 end
end

# Case.create_cases
case1 = Casex.new(0)
puts case1
case1.contenu = "hello"
puts case1.contenu



#  def fill_case(joueur)
#    contenu = joueur.symbol
#  end