class Player #name and wallet
  def initialize()
    welcome
  end

  def welcome
    puts "   Welcome to   "
    puts "================="
    puts "===DPL CASINO==="
    puts "================="
    puts "What is your name?"
    player_name = gets.strip
    puts "Welcome #{player_name}! How much money do you have?"
    puts "$:"
    @player_wallet = gets.strip.to_f
    puts "Excellent. Lets find out if you can increase your $#{@player_wallet}!!"
  end

  def wallet
    @player_wallet
  end

  def remove_from_wallet(value)
    @player_wallet -= value
  end

  def add_to_wallet(value)
    @player_wallet += value
  end
end
