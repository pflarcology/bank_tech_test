require 'bank'
require 'date'

describe Bank do

  it 'responds to the method balance' do
    expect(subject).to respond_to :balance
  end

  it 'initialises with 0' do
    expect(subject.balance).to eq 0
  end

  it 'responds to the method depost money' do
    expect(subject).to respond_to :deposit_money
  end

  it 'can choose the amount entered when depositing money' do
    expect{subject.deposit_money(1)}.to change{subject.balance}.by(1)
  end

  it 'responds to the method withdraw money' do
    expect(subject).to respond_to :withdraw_money
  end

  it 'can withdraw money from the account' do
    expect{subject.withdraw_money(1)}.to change{subject.balance}.by(-1)
  end

  it 'responds to bank statement' do
    expect(subject).to respond_to :bank_statement
  end

  it 'bank statement shows categories' do
    expect(subject.bank_statement).to eq Array.new
  end

  it 'bank statement show information for one deposit' do
    subject.deposit_money(1)
    expect(subject.bank_statement).to eq ([["2017-01-23", "1", "", "1"]])
  end

  it 'bank statement show information for one deposit' do
    subject.withdraw_money(1)
    expect(subject.bank_statement).to eq ([["2017-01-23", "", "1", "-1"]])
  end

  it 'bank statement stores information in reverse order' do
    subject.deposit_money(1)
    subject.withdraw_money(1)
    expect(subject.bank_statement).to eq ([["2017-01-23", "", "1", "0"], ["2017-01-23", "1", "", "1"]])
  end

  it 'responds to data' do
    expect(subject).to respond_to :data
  end

  it 'data initialises as an array' do
    expect(subject.data).to eq Array.new
  end

  it 'data stores information for one deposit' do
    subject.deposit_money(1)
    expect(subject.data).to eq [[Date.today.to_s, '1', '', '1']]
  end

  it 'data stores information for one withdrawal' do
    subject.withdraw_money(1)
    expect(subject.data).to eq [[Date.today.to_s, '', '1', '-1']]
  end

  it 'returns an error if amount being deposited is not a valid number' do
    expect(subject.deposit_money('test')).to eq 'Cannot deposit money: please enter a valid number'
  end

  it 'returns an error if amount being withdrawn is not a valid number' do
    expect(subject.withdraw_money('test')).to eq 'Cannot withdraw money: please enter a valid number'
  end



end
