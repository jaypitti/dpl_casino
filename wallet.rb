class Wallet
  def initialize(amount)
    @wallet = amount
  end
  def amount
    @wallet
  end

  def remove_from_wallet(amount)
    return @wallet -= amount
  end

  def add_to_wallet(amount)
    return @wallet += amount
  end
  def set_amount(value)
    @wallet = value
  end
end
