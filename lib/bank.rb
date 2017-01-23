class Bank

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit_money(amount)
    @balance += amount
  end

  def withdraw_money(amount)
    @balance -= amount
  end

  def bank_statement
    'date || credit || debit || balance'
  end


end
