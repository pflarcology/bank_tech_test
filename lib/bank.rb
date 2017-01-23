require 'date'

class Bank

  attr_reader :balance, :data

  def initialize
    @balance = 0
    @data = []
  end

  def deposit_money(amount)
    return 'Cannot deposit money: please enter a valid number' if !valid_number?(amount)
    @balance += amount
    @data << [Date.today.to_s, amount.to_s, '', @balance.to_s]
  end

  def withdraw_money(amount)
    return 'Cannot withdraw money: please enter a valid number' if !valid_number?(amount)
    @balance -= amount
    @data << [Date.today.to_s, '' , amount.to_s, @balance.to_s]
  end

  def bank_statement
    puts "#{'date'.ljust(10)} || #{'credit'.ljust(7)} || #{'debit'.ljust(7)} || balance"
    print_method
  end

  private

  def print_method
    @data.reverse.each do |date, credit, debit, balance|
      puts date + ' || ' + credit.ljust(7) + ' || ' + debit.ljust(7) + ' || ' + balance
    end
  end

  def valid_number?(amount)
    amount.is_a? Numeric
  end

end
