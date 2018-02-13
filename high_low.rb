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
#require_relative 'game'
require_relative 'player'
require_relative 'wallet'

class Highlow

  def initialize(player)
     @player = player
     @wallet = player.wallet.wallet
  end


  def number_generate1
    @randonum1 = rand(1...100)
  end

  def number_generate2
    @randonum2 = rand(1...100)
  end

  def hl_walletbal
    puts "You have $#{@player.wallet.wallet} left." #@player.wallet
  end
  def hl_win
    puts '-' * 20
    puts "Congrats! You won!"
    @player.wallet.add(@betamount)
    puts "#{@betamount} was added to your wallet."
    hl_walletbal
  end


  def hl_lose
    puts '-' * 20
    puts "Looks like you lost."
    @player.wallet.subtract(@betamount)
    puts "#{@betamount} was taken from your wallet."
    hl_walletbal
  end
  def hl_stay
    puts "Would you like to play again?"
    puts "1) Yes"
    puts "2) No"
    choice = gets.to_i
    case choice
      when 1
        hl_bet
      when 2
        puts "Thank you, and be sure to *cough*lose*cough* spend your money at the other games!"
      else
        "Gesundheit."
      end
  end

  def highlow_high
    if @randonum1 < @randonum2
      hl_win
    elsif @randonum1 == @randonum2
      puts "A tie! No winner or loser."
    else
      hl_lose
    end
  end

  def highlow_low
    if @randonum1 > @randonum2
      hl_win
    elsif @randonum1 == @randonum2
      puts "A tie! No winner or loser."
    else
      hl_lose
    end
  end

  def hl_bet
    puts 'How much would you like to bet?'
    @betamount = gets.to_i
    puts "=" * 20
    number_generate1
    highlow_menu
  end



  def highlow_menu
    puts "The number is #{@randonum1}! Will the next number be higher or lower?"
    puts '=' * 20
    puts "1) Higher"
    puts "2) Lower"
    puts "3) Wallet Balance"
    puts "4) Leave"
    @bet_or_not = gets.to_i
    puts '-' * 20
    case @bet_or_not
    when 1
      number_generate2
      puts "The new number is #{@randonum2}!"
      highlow_high
      hl_stay
    when 2
      number_generate2
      puts "The new number is #{@randonum2}!"
      highlow_low
      hl_stay
    when 3
      hl_walletbal
      highlow_menu
    when 4
      puts "Thank you, and be sure to *cough*lose*cough* spend your money at the other games!"
    else
      puts "Gesundheit."
      highlow_menu
    end
  end

  def highlow_greeting
    puts "=" * 20
    puts "Hello! would you like to try your luck on a game of High Low?"
    puts "1) Sure!"
    puts "2) Nah I'm good."
    yay_or_nay = gets.to_i
    if yay_or_nay == 1
      puts '=' * 20
      puts "The range is from 1 to 99."
      hl_bet
    elsif yay_or_nay == 2
      puts "Okay, be sure to *cough*lose*cough* spend your money at the other games!"
    else
      puts "Gesundheit."
      highlow_greeting
    end
  end

end
