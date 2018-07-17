require 'pry'

# Ceci est la gestion de chaque
# case du tableau de jeu
class BoardCase
  attr_writer :value

  def initialize
    @value = ' '
  end

  def value(value)
    if @value == ' '
      # binding.pry
      until 'xo'.include?(value.downcase.to_s)
        # binding.pry
        print "Ne pas jouer autre chose que 'x' ou 'o' \n |> "
        value = gets.chomp.to_s.downcase
      end
      @value = value.downcase
    else
      puts "C'est moi ou vous essayez de tricher ?"
      puts 'oui... vous perdez votre tour'
      @value
    end
  end

  def to_s
    @value
  end
end
