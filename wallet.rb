class Wallet < Player
  def initialize(amount)
    @wallet = amount
  end
  def wallet
    return @wallet
  end

  def remove_from_wallet(amount)
    return @wallet -= amount
  end
  
  def add_to_wallet(amount)
    return @wallet += amount
  end
end
