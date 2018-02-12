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
    
  end

end
