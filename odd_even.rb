require 'pry'
require 'colorize'
require_relative 'player'
require_relative 'wallet'

class Odds_evens

  attr_reader :player

    def initialize (player)
      @player = player
      guess
    end

    def guess
      puts "The game instructions of 'Odds and Evens' are simple!"
      puts "You have two dice. You will roll the dice and the sum of the two numbers will be odd or even."
      puts "Before you roll, guess if that sum will be odd or even."
      puts "After you declare 'odd' or 'even', but before you roll, decide how much money you are willing to bet your guess is correct."
      puts "Lets play! Enter 1 if you bet odd, enter 2 if you bet even, or enter 3 to leave the game and return to the casino."
      @player_guess = gets.strip.to_i
        if @player_guess == 1
          puts "you guessed odd"
          bet
        elsif @player_guess == 2
          puts "you guessed even"
          bet
        elsif @player_guess == 3
        else
          puts "Input error. Try again".red
          guess
        end
    end

    def bet
      puts "Before you roll, how much money would you like to gamble? (you currently have $#{@player.wallet} in your wallet)"
      @player_gamble = gets.strip.to_i
        if @player_gamble > @player.wallet
          puts "Too bad, you don't have enough money in your wallet to gamble that much! Enter an ammount smaller than $#{@player.wallet}.".red
          bet
        elsif @player_gamble <= @player.wallet
          puts "Sounds great! You have gambled $#{@player_gamble}. Let's roll the dice."
          roll
        end
    end

    def roll
      dice1 = rand(1..6)
      dice2 = rand(1..6)
      dice_sum = dice1 + dice2
      puts "#{dice1} + #{dice2} = #{dice_sum}"
      if dice_sum % 2 == 0
        @evenorodd = 2
        puts "#{dice_sum} is Even!"
        outcome
      else
        @evenorodd = 1
        puts "#{dice_sum} is Odd!"
        outcome
      end
    end

    def outcome
      if @evenorodd == @player_guess
        puts "You guessed correct!"
        @player.wallet += @player_gamble
      else
        puts "Loser"
        @player.wallet -= @player_gamble
      end
    end

end

player = Player.new
Odds_evens.new(player)
