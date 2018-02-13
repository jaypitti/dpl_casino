require_relative 'deck'
require_relative 'player'
require 'colorize' #do I need this?
#do we need to initiate a new deck for this so we aren't using one that is missing cards?

class Blackjack

  attr_reader :player, :casino

  def initialize(player)
    @player = player
    @wallet = @player.wallet.wallet
    @hand = []
    @dealer_hand = []
    play_blackjack
  end

  def play_blackjack
    puts '1) Deal Blackjack'.colorize(:magenta)
    puts '2) Check Wallet'.colorize(:cyan)
    puts '3) Exit to Casino'.colorize(:magenta)
    choice = gets.to_i
    if choice == 1
      deal
    elsif choice == 2
      puts "You have $#{@wallet} in your wallet.".colorize(:green)
    elsif choice == 3
      puts "Goodbye"#@casino.menu
    else
      puts "Invalid option".colorize(:red)
    end
  end

  def deal
    puts "How much do you want to bet?".colorize(:cyan)
    print "> "
    @user_bet = gets.strip.to_i
    @player.wallet.subtract(@user_bet)

    @deck = Deck.new
    @cards = @deck.shuffle_cards
    @hand << @cards.pop
    @dealer_hand << @cards.pop
    @hand << @cards.pop
    puts "Your cards are: \n".colorize(:cyan)
    @hand.each do |card|
      puts "> #{card.rank} of #{card.suit}".colorize(:magenta)
    end
    puts "\n Dealers shown card is: \n".colorize(:cyan)
    @dealer_hand.each do |card|
      puts "> #{card.rank} of #{card.suit}".colorize(:magenta)
    end
    more_cards
  end

  def more_cards
    puts "\n Would you like another card? \n".colorize(:cyan)
    puts "1) Yes, hit me".colorize(:green)
    puts "2) No, stand".colorize(:red)
    print "> "
    choice = gets.strip.to_i
    case choice
      when 1
        hit
      when 2
        calc(@hand)
      else
        puts "Invalid choice".colorize(:red)
        more_cards
      end
  end

  def hit
    puts "Hit".colorize(:green)
    @hand << @cards.pop
    puts "\n Your cards are: \n".colorize(:magenta)
    @hand.each do |card|
      puts "> #{card.rank} of #{card.suit}".colorize(:cyan)
    end
    puts "Dealers shown card is \n:".colorize(:magenta)
    @dealer_hand.each do |card|
      puts "> #{card.rank} of #{card.suit}".colorize(:cyan)
    end
    more_cards
  end

  def calc(hand)
    @player_value = 0
    @hand.each do |card|
      value(card)
      @player_value += @value
    end
    total(@player_value)
  end

  def value(card)
    case card.rank
      when '2','3','4','5','6','7','8','9','10'
        @value = card.rank.to_i
      when 'A'
        puts "For card #{card.rank} of #{card.suit}".colorize(:cyan)
        puts "\n Would you like to use value: 1 or 11? \n".colorize(:cyan)
        print "> "
        choice = gets.strip.to_i
        #this could be another method outside of the value meth.
        if (choice == 1) || (choice == 11)
          @value = choice
        else
          puts "No cheating, you have been sent back to the main casino floor".colorize(:red)
          #@casino.menu
          #where should this put the player back to?
        end
      when 'J', 'Q', 'K'
        @value = 10
      else
    end
  end

  def value_dealer(card)
    case card.rank
      when '2','3','4','5','6','7','8','9','10'
        @value = card.rank.to_i
      when 'A'
        if dealer_value <= 10
          choice = 11
        else
          choice = 1
        end
          @value = choice
      when 'J', 'Q', 'K'
        @value = 10
      else
    end
  end

  def total(player_value)
    puts "\n Your cards are: \n".colorize(:cyan)
    @hand.each do |card|
      puts "> #{card.rank} of #{card.suit}".colorize(:magenta)
    end
    puts "\n Your current card total is: #{@player_value} \n".colorize(:cyan)
    puts "- " * 15
    @dealer_hand << @cards.pop
    @dealer_value = 0
    @dealer_hand.each do |card|
      value_dealer(card)
      @dealer_value += @value
    end

    puts "\n The dealers cards are: \n".colorize(:magenta)
    @dealer_hand.each do |card|
      puts "> #{card.rank} of #{card.suit}".colorize(:cyan)
    end
    puts "\n Dealers current card total is: #{@dealer_value} \n".colorize(:green)
    win_lose
  end

  def win_lose
    if @player_value > 21
      puts "Sorry you lose \n".colorize(:red)

    elsif @dealer_value >= @player_value && @dealer_value < 21
      puts "Sorry you lose".colorize(:red)
      puts "\n You now have $#{@player.wallet.wallet} \n".colorize(:red)


    elsif @dealer_value > 21 && @player_value > 21
      puts "It's a tie \n".colorize(:cyan)
      @wallet += @user_bet
      @player.set_wallet(@wallet)
      puts "\n You now have $#{@player.wallet.wallet} \n"

    elsif @player_value == 21
      puts "JACKPOT \n".colorize(:yellow)
      @player.wallet.add(@user_bet * 10)
      puts "\n You now have $#{@player.wallet.wallet} \n"

    elsif @dealer_value == 21
      puts "Dealer wins \n".colorize(:red)
      puts "\n You now have $#{@player.wallet.wallet} \n".colorize(:red)

    else
      puts "Player wins \n".colorize(:green)
      @player.wallet.add(@user_bet * 3)
      puts "\n You now have $#{@player.wallet.wallet} \n".colorize(:green)

    end
    @hand.clear
    @dealer_hand.clear
    play_blackjack
  end

end

#test for empty deck, or start new one.
