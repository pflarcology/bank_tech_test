require 'date'

class Bank

  attr_reader :balance, :data

  def initialize
    @balance = 0
    @data = []
  end

  def deposit_money(amount)
    @balance += amount
    @data << [Date.today, nil, amount, @balance]
  end

  def withdraw_money(amount)
    @balance -= amount
  end

  def bank_statement
    'date || credit || debit || balance'
  end


end
