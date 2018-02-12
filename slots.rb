class Slots
  attr_reader :player, :casino

  def initialize(player, casino)
    @player = player
    @casino = casino
    play_game # should this be a Slots. ...
  end

  def play_game # should this be a self. ..
    puts '1) spin'
    puts '2) exit to casino'
    choice = gets.to_i
    if choice == 2
      @casino.menu
    end
  end

end
