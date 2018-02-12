require_relative 'player'
require_relative 'Slots1'

class Game

  attr_accessor :player_wallet

def initialize
  Game.move
end

@values = Array[
  ["▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓",],
  ["▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓",],
  ["▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓",],
  ["▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓",],
  ["▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓",],
  ["▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓",],
  ["▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓",],
  ["▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓",],
  ["▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓",],
  ["▓","S","L","O","T","S","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓",],
  ["▓","╔","╦","╦","╦","╦","╦","╗","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓",],
  ["▓","║","♥","║","♥","║","♥","║","/","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓",],
  ["▓","╚","╧","╩","╧","╩","╧","╝","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓",],
  ["▓","░","░","░","░","░","░","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓",],
  ["▓","▓","▓","▓","▓","▓","░","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓",],
  ["▓","▓","▓","▓","▓","▓","░","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓",],
  ["▓","▓","▓","▓","▓","▓","░","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓",],
  ["░","░","░","░","░","░","░","░","░","░","░","░","░","░","░","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓",],
  ["░","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","░","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓",],
  ["░","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","░","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓",],
  ["░","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","░","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓",],
  ["░","B","L","A","C","K","▄","▓","▓","▓","▓","▓","▓","▓","░","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓",],
  ["░","J","A","C","K","▐","☺","▐","▓","▓","▓","▓","▓","▓","░","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓",],
  ["░","╓","╔","═","═","═","═","═","═","═","═","═","╗","╖","░","░","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓",],
  ["░","╓","║"," "," "," "," "," "," "," "," "," ","║","╖","░","░","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓",],
  ["░","╓","║"," "," "," ","B","&","J"," "," "," ","║","╖","░","░","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓",],
  ["░","╓","╚","═","═","═","═","═","═","═","═","═","╝","╖","░","░","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓",],
  ["▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓",],
  ["▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓","▓",]
]

@player = Player.new

def self.draw(a,b)
  push_frame = @values.length
  puts "\n" * push_frame.to_i
  puts @x,@y
  a = a
  b = b
  @values[a][b] = "╬"
  # Loop over each row Array.
  @values.each do |y|

    # Loop over each cell in the row.
    y.each do |cell|
      print cell
    end


    # End of row.
    puts ""
  end
end

require 'io/console'

# Reads kexpresses from the user including 2 and 3 escape character sequences.
def self.read_char
  STDIN.echo = false
  STDIN.raw!

  input = STDIN.getc.chr
  if input == "\e" then
    input << STDIN.read_nonblock(3) rescue nil
    input << STDIN.read_nonblock(2) rescue nil
  end
ensure
  STDIN.echo = true
  STDIN.cooked!

  return input
end
@y = 10
@x = 10
def self.move()
  if @x.between?(0, 8) && @y.between?(9, 12)
    slots = Slots.new(@player, @player.wallet)
      slots.menu_options(slots.display_menu)
  end
  c = Game.read_char
  puts c
  case c
    #up
  when "\e[A"
    if @y <= 0
      @y += 1
    end
    @y -= 1
    if @values[@y][@x] == "░"
      @values[@y + 1][@x] = "░"
    else
      @values[@y + 1][@x] = "▓"
    end
    #down
  when "\e[B"
    if @y >= @values.length - 1
      @y -= 1
    end
    @y += 1
    #CARPET CHECK
    if @values[@y][@x] == "░"
      @values[@y - 1][@x] = "░"
    else
      @values[@y - 1][@x] = "▓"
    end
    #right
  when "\e[C"
    if @x >= @values[0].length - 1
      @x -= 1
    end
    @x += 1
    #CARPET CHECK
    if @values[@y][@x] == "░"
      @values[@y][@x - 1] = "░"
    else
      @values[@y][@x - 1] = "▓"
    end
    #left
  when "\e[D"
    if @x <= 0
      @x += 1
    end
    @x -= 1
    if @values[@y][@x] == "░"
      @values[@y][@x + 1] = "░"
    else
      @values[@y][@x + 1] = "▓"
    end
  when "\u0003"
    puts "CONTROL-C"
    exit 0
  end
  system ("cls")
  Game.draw(@y,@x)
end
while true
  Game.move
end
end
game = Game.new()
