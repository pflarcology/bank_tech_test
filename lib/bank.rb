require 'date'

class Bank

  attr_reader :balance, :data

  def initialize
    @balance = 0
    @data = []
  end

  def deposit_money(amount)
    @balance += amount
    @data << [Date.today.to_s, amount.to_s, '', @balance.to_s]
  end

  def withdraw_money(amount)
    @balance -= amount
    @data << [Date.today.to_s, '' , amount.to_s, @balance.to_s]
  end

  def bank_statement
    string = 'date || credit || debit || balance'
    @data.reverse.each do |date, credit, debit, balance|
      string += " \n " + date + ' || ' + credit + ' || ' + debit + ' || ' + balance
    end
    string
  end


end
