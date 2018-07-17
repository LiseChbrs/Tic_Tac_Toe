require 'pry'
require_relative 'player.rb'
require_relative 'boardcase.rb'
require_relative 'board.rb'
require_relative 'game.rb'

def restart_game
  puts 'Voulez vous refaire une partie ? \n (y/n)'
  print ' |> '
  if gets.chomp.to_s.downcase == 'y'
    system('clear')
    a = Game.new
    a.launch
    restart_game
  else 
    exit
  end
end

system('clear')
a = Game.new
a.launch
restart_game