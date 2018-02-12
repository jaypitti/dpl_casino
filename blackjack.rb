require_relative 'deck'
require_relative 'player' #do I need this?
#do we need to initiate a new deck for this so we aren't using one that is missing cards?

class Blackjack

  attr_reader :player, :casino

  def initialize(player, wallet)
    @player = player
    @wallet = wallet
    @hand = []
    @dealer_hand = []
    play_blackjack
  end

  def play_blackjack
    puts '1) Deal Blackjack'
    puts '2) Exit to casino'
    choice = gets.to_i
    if choice == 1
      deal
    elsif choice == 2
      puts "Goodbye"#@casino.menu
    else
      puts "Invalid option"
    end
  end

  def deal
    puts "How much do you want to bet"
    print "> "
    @user_bet = gets.strip.to_i
    @wallet = @player.player_bet(@wallet, @user_bet) 

    @deck = Deck.new
    @cards = @deck.shuffle_cards
    @hand << @cards.pop
    @dealer_hand << @cards.pop
    @hand << @cards.pop
    puts "Your cards are:"
    @hand.each do |card|
      puts "> #{card.rank} of #{card.suit}"
    end
    puts "Dealers shown card is:"
    @dealer_hand.each do |card|
      puts "> #{card.rank} of #{card.suit}"
    end
    more_cards
  end

  def more_cards
    puts "Would you like another card?"
    puts "1) Yes, hit me"
    puts "2) No, stand"
    print "> "
    choice = gets.strip.to_i
    case choice
      when 1
        hit
      when 2
        calc(@hand)
      else
        puts "Invalid choice"
        more_cards
      end
  end

  def hit
    puts "Hit"
    @hand << @cards.pop
    puts "Your cards are:"
    @hand.each do |card|
      puts "> #{card.rank} of #{card.suit}"
    end
    puts "Dealers shown card is:"
    @dealer_hand.each do |card|
      puts "> #{card.rank} of #{card.suit}"
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
        puts "For card #{card.rank} of #{card.suit}"
        puts "Would you like to use value: 1 or 11?"
        print "> "
        choice = gets.strip.to_i
        #this could be another method outside of the value meth.
        if (choice == 1) || (choice == 11)
          @value = choice
        else
          puts "No cheating, you have been sent back to the main casino floor"
          #@casino.menu
          #where should this put the player back to?
        end
      when 'J', 'Q', 'K'
        @value = 10
      else
    end
  end

  def total(player_value)
    puts "Your cards are:"
    @hand.each do |card|
      puts "> #{card.rank} of #{card.suit}"
    end
    puts "Your current card total is: #{@player_value}"
    puts "- " * 15
    @dealer_hand << @cards.pop
    @dealer_value = 0
    @dealer_hand.each do |card|
      value(card)
      @dealer_value += @value
    end

    puts "The dealers cards are:"
    @dealer_hand.each do |card|
      puts "> #{card.rank} of #{card.suit}"
    end
    puts "Dealers current card total is: #{@dealer_value}"
    win_loose
  end

  def win_loose
    if @player_value > 21
      puts "Sorry you loose"

    elsif @dealer_value >= @player_value && @dealer_value < 21
      puts "Sorry you loose"

    elsif @dealer_value > 21 && @player_value > 21
      puts "It's a tie"

    elsif @player_value == 21
      puts "Jackpot"
    elsif @dealer_value == 21
      puts "Dealer wins"
    else
      puts "Player wins"
    end
    @hand.clear
    @dealer_hand.clear
    play_blackjack
  end

end

#test for empty deck, or start new one.
