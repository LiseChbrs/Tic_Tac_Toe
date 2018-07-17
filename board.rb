require 'pry'
require_relative 'boardcase.rb'

# Ceci est le plateau de jeu
class Board
  attr_writer :grid, :col1, :col2, :col3
  attr_accessor :abs, :ord, :won

  def initialize
    @col1 = [BoardCase.new, BoardCase.new, BoardCase.new]
    @col2 = [BoardCase.new, BoardCase.new, BoardCase.new]
    @col3 = [BoardCase.new, BoardCase.new, BoardCase.new]
    @grid = [@col1, @col2, @col3]
    @abs = -1
    @ord = -1
    @won = 0
  end

  def to_s
    puts '----------------------------------'
    puts '--         your board:          --'
    puts '----------------------------------' 
    puts "            #{@grid[0][0].to_s} | #{@grid[0][1].to_s} | #{@grid[0][2].to_s}"
    puts '           ------------'
    puts "            #{@grid[1][0].to_s} | #{@grid[1][1].to_s} | #{@grid[1][2].to_s}"
    puts '           ------------'
    puts "            #{@grid[2][0].to_s} | #{@grid[2][1].to_s} | #{@grid[2][2].to_s}"
    puts "\n \n ----------------------------------"
  end

  def conversion(int)
    @ord = (int % 3).zero? ? 2 : (int % 3).to_i - 1
    @abs = ((int / 3.0).ceil - 1.0).to_i
  end

  def grid(abs, ord, val)
    @grid[abs][ord].value(val)
  end



  def align?
    win_arr = [
                [@grid[0][0], @grid[0][1], @grid[0][2]].join, 
                [@grid[1][0], @grid[1][1], @grid[1][2]].join, 
                [@grid[2][0], @grid[2][1], @grid[2][2]].join, 

                [@grid[0][0], @grid[1][0], @grid[2][0]].join,
                [@grid[0][1], @grid[1][1], @grid[2][1]].join,
                [@grid[0][2], @grid[1][2], @grid[2][2]].join,

                [@grid[0][0], @grid[1][1], @grid[2][2]].join, 
                [@grid[2][0], @grid[1][1], @grid[0][2]].join
              ]
    win_arr.each do |elem|
      if 'xxx' == elem
        @won = 1
        break
      elsif 'ooo' == elem
        @won = 2
        break
      else
        @won
      end
    end
  end
end

# binding.pry
