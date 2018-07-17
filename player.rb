require 'pry'

# Ceci est la classe des joueurs
class Player
  attr_accessor :name, :win, :symb

  def initialize(name, symb)
    @name = name
    @win = false
    @symb = symb
  end

  def to_s
    "Joueur : #{@name}, plays #{@symb}"
  end
end
