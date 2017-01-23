class Bank

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit_money
    @balance += 1
  end

end
