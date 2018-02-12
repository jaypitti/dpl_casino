require_relative 'wallet'

class Player #name and wallet

  attr_accessor :wallet

  def initialize()
    puts "   Welcome to   "
    puts "================="
    puts "===DPL CASINO==="
    puts "================="
    puts "What is your name?"
    player_name = gets.strip
    puts "Welcome #{player_name}! How much money do you have?"
    puts "$:"
    amount = gets.strip.to_i
    @wallet = Wallet.new(amount)
    @player_wallet = @wallet.amount
    puts @wallet.amount
    binding.pry
    puts "Excellent. Lets find out if you can increase your $#{@player_wallet}!!"
  end
  def wallet
    return @player_wallet
  end
  def player_bet(wallet, bet)
    @player_wallet = wallet -= bet
    return @player_wallet
  end
  def retrieve_earnings(total)
    @player_wallet = total
  end
  def add_to_wallet(amount)
    @player_wallet += amount
  end
end
