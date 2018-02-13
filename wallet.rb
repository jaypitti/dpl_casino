class Wallet
  def initialize(amount)
    @wallet = amount
  end

  def wallet
    @wallet
  end
  def subtract(value)
    @wallet -= value
  end
  def add(value)
    @wallet += value
  end
end
