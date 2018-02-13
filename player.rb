require_relative 'wallet'

class Player #name and wallet

  attr_accessor :wallet

  def initialize()
    puts "   Welcome to   "
    puts "================="
    puts "===DPL CASINO==="
    puts "================="
    puts "What is your name?"
    @player_name = gets.strip
    puts "Welcome #{@player_name}! How much money do you have?"
    puts "$:"
    amount = gets.strip.to_i
    @wallet = Wallet.new(amount)
    puts @wallet.wallet
    puts "Excellent. Lets find out if you can increase your $#{@wallet.wallet}!!"
  end
end
