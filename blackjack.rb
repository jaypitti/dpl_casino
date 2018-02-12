require_relative 'deck'
require_relative 'player' #do I need this?
#do we need to initiate a new deck for this so we aren't using one that is missing cards?

class Blackjack

  attr_reader :player, :casino

  def initialize(player, casino)
    @player = player
    @casino = casino
    play_blackjack
  end

  def play_blackjack
    puts '1) Deal'
    puts '2) Exit to casino'
    choice = gets.to_i
    if choice == 1
      deal
    elsif choice == 2
      @casino.menu
    else
      puts "Invalid option"
    end
  end

  def deal
    @deck = Deck.new
    cards = @deck.shuffle_cards
    card1 = cards.pop
    card2 = cards.pop
    puts "Your cards are: #{card1.rank} of #{card1.suit}  & #{card2.rank} of #{card2.suit}"
    card1_value = value(card1)
    card2_value = value(card2)

    total(card1_value, card2_value)
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
        if choice == 1 || choice == 11
          @value = choice
        else 
          puts "No cheating, you have been sent back to the main casino floor"
          @casino.menu
          #where should this put the player back to?
        end
      when 'J', 'Q', 'K'
        @value = 10
      else 
    end
  end

  def total(card1_value, card2_value)
    puts "Your current card total is: #{card1_value + card2_value}"
    more_cards
  end

  def new_cards
    puts "Would you like another card?"
    puts "> "
    
  end
end
