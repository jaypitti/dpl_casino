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

require_relative 'player'

class Highlow

  def initialize
    highlow_greeting
  end

  def number_generate
    @randonum = rand(1...100)
  end

  def hl_walletbal
    puts "You have $#{@player.wallet} left."
  end

  def hl_win
    puts '-' * 20
    puts "Congrats! You won!"
    @player.add_to_wallet(@betamount)
    puts "#{@betamount} was added to your wallet."
    @highlow.hl_walletbal
  end

  def hl_lose
    puts '-' * 20
    puts "Looks like you lost."
    @player.remove_from_wallet(@betamount)
    puts "#{@betamount} was taken from your wallet."
    @highlow.hl_walletbal
  end

  def highlow_high
    if @bet_or_not > @randonum
      @highlow.hl_win
      @highlow.hl_walletbal
    elsif @bet_or_not == @randonum
      puts "A tie! No winner or loser."
    else
      @highlow.hl_lose
      @highlow.hl_walletbal
    end
    @highlow.highlow_menu
  end

  def highlow_low
    if @bet_or_not < @randonum
      @highlow.hl_win
      @highlow.hl_walletbal
    elsif @bet_or_not == @randonum
      puts "A tie! No winner or loser."
    else
      @highlow.hl_lose
      @highlow.hl_walletbal
    end
    @highlow.highlow_menu
  end

  def highlow_menu
    puts '=' * 20
    puts "The range is from 1 to 99."
    puts 'How much would you like to bet?'
    @betamount = gets.to_i
    puts "=" * 20
    @highlow.number_generate
    puts "The number is #{@randonum}! Will the next number be higher or lower?"
    puts '=' * 20
    puts "1) Higher"
    puts "2) Lower"
    puts "3) Wallet Balance"
    puts "4) Leave"
    @highlow.number_generate
    @bet_or_not = gets.to_i
    "The new number is #{@randonum}!"
    case @bet_or_not
    when 1
      @highlow.highlow_high
    when 2
      @highlow.highlow_low
    when 3
      @highlow.hl_walletbal
    when 4
      puts "Okay, enjoy your stay!"
    else
      puts "Im sorry, what was that?"
      @highlow.highlow_menu
    end
  end

  def highlow_greeting
    puts "=" * 20
    puts "Hello! would you like to try your luck on a game of High Low?"
    puts "1) Sure!"
    puts "2) Nah I'm good."
    yay_or_nay = gets.to_i
    if yay_or_nay == 1
      @highlow.highlow_menu
    elsif yay_or_nay == 2
      puts "Okay, enjoy your stay!"
    else 
      puts "I'm sorry, I didn't catch that."
      @highlow.highlow_greeting
    end
  end

end

@player = Player.new
@highlow = Highlow.new(@player)
@highlow.highlow_greeting