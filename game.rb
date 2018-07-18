require 'pry'
require_relative 'player.rb'
require_relative 'boardcase.rb'
require_relative 'board.rb'

# Ceci est la classe du jeu entier
class Game
  attr_accessor :player1, :player2, :board

  def initialize
    puts '----------------------------------'
    puts '-- Bienvenu dans Tic-Tac-Toe !! --'
    puts '----------------------------------'
    puts "Nom du joueur 1 : \n |>"
    play1 = gets.chomp
    @player1 = Player.new(play1, 'x')
    puts "Nom du joueur 2 : \n |>"
    play2 = gets.chomp
    @player2 = Player.new(play2, 'o')
    @board = Board.new
  end

  def player1_play
    how_to
    @board.to_s
    puts "#{@player1.name} veuillez choisir votre case : \n |> "
    @board.conversion(gets.chomp.to_i) #conversion du fichier board : le chiffre que rentre l'utilisateur doit être converti et interprété dans la case correspondante
    @board.grid(@board.abs, @board.ord, @player1.symb) #réactualise la grille 
  end

  def player2_play
    how_to
    @board.to_s
    puts "#{@player2.name} veuillez choisir votre case : \n |> " #même chose pour le player2
    @board.conversion(gets.chomp.to_i)
    @board.grid(@board.abs, @board.ord, @player2.symb)
  end

  def how_to #permet d'afficher le numéro des cases à l'utilisateur
    puts '----------------------------------'
    puts '--   Type one of these figures: --'
    puts '----------------------------------'
    puts '            1 | 2 | 3'
    puts '           ------------'
    puts '            4 | 5 | 6'
    puts '           ------------'
    puts '            7 | 8 | 9'
    puts "\n"
  end

  def anyone_play #A qui le tour? 
    i = 1 #tour 1
    while i <= 9 #jusqu'au tour 9
      system('clear')
      if i.odd? #si i est impair 
        player1_play #le joueur1 joue 
        @board.align? #lorsque l'élément X du joueur1 est aligné dans le board
        break if @board.won != 0 #la boucle est rompu car joueur 1 a gagné
      else
        player2_play
        @board.align?
        break if @board.won != 0 #même principe pour le joueur2
      end
      i += 1
    end

    return @board.align?
  end

  def launch
    anyone_play
    if @board.won != 0 
      puts "le joueur #{@board.won} l'emporte !!!"
      restart_game
    else
      puts "Personne n'a gagné... prévisible."
      restart_game
    end
  end
end

