# X show menu
#   X exit option
# X ask for bet amount
# X show a number from 1 to 100
# X ask high or low
# X get input
# X randomize from 1 - 100
# X compare with higher or lower input
# X win or lose
# X subtract/add from/to wallet
require_relative 'game'
require_relative 'player'
require_relative 'wallet'

class Highlow

  def initialize(player)
    @player = player
  end

  def self.number_generate
    @randonum = rand(1...100)
  end

  def self.hl_walletbal
    puts "You have $#{@player.wallet} left."
  end

  def self.hl_win
    puts '-' * 20
    puts "Congrats! You won!"
    @player.wallet += @betamount
    puts "#{@betamount} was added to your wallet."
    Highlow.hl_walletbal
  end

  def self.hl_lose
    puts '-' * 20
    puts "Looks like you lost."
    @player.wallet -= @betamount
    puts "#{@betamount} was taken from your wallet."
    Highlow.hl_walletbal
  end

  def self.highlow_high
    if @bet_or_not > @randonum
      Highlow.hl_win
      Highlow.hl_walletbal
    elsif @bet_or_not == @randonum
      puts "A tie! No winner or loser."
    else
      Highlow.hl_lose
      Highlow.hl_walletbal
    end
    Highlow.highlow_menu
  end

  def self.highlow_low
    if @bet_or_not < @randonum
      Highlow.hl_win
      Highlow.hl_walletbal
    elsif @bet_or_not == @randonum
      puts "A tie! No winner or loser."
    else
      Highlow.hl_lose
      Highlow.hl_walletbal
    end
    Highlow.highlow_menu
  end

  def self.hl_bet
    puts '=' * 20
    puts "The range is from 1 to 99."
    puts 'How much would you like to bet?'
    @betamount = gets.to_i
    puts "=" * 20
    Highlow.number_generate
    Highlow.highlow_menu
  end

  def self.highlow_menu
    puts "The number is #{@randonum}! Will the next number be higher or lower?"
    puts '=' * 20
    puts "1) Higher"
    puts "2) Lower"
    puts "3) Wallet Balance"
    puts "4) Leave"
    @bet_or_not = gets.to_i
    case @bet_or_not
    when 1
      Highlow.number_generate
      puts "The new number is #{@randonum}!"
      Highlow.highlow_high
    when 2
      Highlow.number_generate
      puts "The new number is #{@randonum}!"
      Highlow.highlow_low
    when 3
      Highlow.hl_walletbal
      Highlow.highlow_menu
    when 4
      puts "Okay, enjoy your stay!"
    else
      puts "Im sorry, what was that?"
      Highlow.highlow_menu
    end
  end

  def self.highlow_greeting
    puts "=" * 20
    puts "Hello! would you like to try your luck on a game of High Low?"
    puts "1) Sure!"
    puts "2) Nah I'm good."
    yay_or_nay = gets.to_i
    if yay_or_nay == 1
      Highlow.hl_bet
    elsif yay_or_nay == 2
      puts "Okay, enjoy your stay!"
    else 
      puts "I'm sorry, I didn't catch that."
      Highlow.highlow_greeting
    end
  end

end

Highlow.highlow_greeting