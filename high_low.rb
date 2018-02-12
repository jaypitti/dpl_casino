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
# require_relative 'game'
# require_relative 'player'
# require_relative 'wallet'

class Highlow

  # def initialize(player, wallet)
  #   @player = player
  #   @wallet = wallet
  # end
  @wallet = 1000

  def self.number_generate
    @randonum = rand(1...100)
  end

  def self.hl_walletbal
    puts "You have $#{@wallet} left." #@player.wallet
  end

  def self.hl_win
    puts '-' * 20
    puts "Congrats! You won!"
    @wallet += @betamount
    puts "#{@betamount} was added to your wallet."
    Highlow.hl_walletbal
  end

  def self.hl_lose
    puts '-' * 20
    puts "Looks like you lost."
    @wallet -= @betamount
    puts "#{@betamount} was taken from your wallet."
    Highlow.hl_walletbal
  end

  def self.highlow_high
    if @bet_or_not > @randonum
      Highlow.hl_win
    elsif @bet_or_not == @randonum
      puts "A tie! No winner or loser."
    else
      Highlow.hl_lose
    end
    Highlow.highlow_menu
  end

  def self.highlow_low
    if @bet_or_not < @randonum
      Highlow.hl_win
    elsif @bet_or_not == @randonum
      puts "A tie! No winner or loser."
    else
      Highlow.hl_lose
    end
    Highlow.highlow_menu
  end

  def self.hl_bet
    puts 'How much would you like to bet?'
    @betamount = gets.to_i
    puts "=" * 20
    Highlow.number_generate
    Highlow.highlow_menu
  end

  def self.hl_stay
    puts "Would you like to play again?"
    puts "1) Yes"
    puts "2) No"
    choice = gets.to_i
    case choice
      when 1
        Highlow.hl_bet
      when 2
        puts "Thank you, and be sure to *cough*lose*cough* spend your money at the other games!"
      else
        "Gesundheit."
      end
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
      Highlow.hl_stay
    when 2
      Highlow.number_generate
      puts "The new number is #{@randonum}!"
      Highlow.highlow_low
      Highlow.hl_stay
    when 3
      Highlow.hl_walletbal
      Highlow.highlow_menu
    when 4
      puts "Thank you, and be sure to *cough*lose*cough* spend your money at the other games!"
    else
      puts "Gesundheit."
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
      puts '=' * 20
      puts "The range is from 1 to 99."
      Highlow.hl_bet
    elsif yay_or_nay == 2
      puts "Okay, be sure to *cough*lose*cough* spend your money at the other games!"
    else 
      puts "Gesundheit."
      Highlow.highlow_greeting
    end
  end

end

@highlow = Highlow.new
Highlow.highlow_greeting