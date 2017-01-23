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
    expect(subject.bank_statement).to eq ('date || credit || debit || balance')
  end

  it 'bank statement show information for one deposit' do
    subject.deposit_money(1)
    expect(subject.bank_statement).to eq ("date || credit || debit || balance \n #{Date.today} || 1 ||  || 1")
  end

  it 'bank statement show information for one deposit' do
    subject.withdraw_money(1)
    expect(subject.bank_statement).to eq ("date || credit || debit || balance \n #{Date.today} ||  || 1 || -1")
  end

  it 'bank statement stores information in reverse order' do
    subject.deposit_money(1)
    subject.withdraw_money(1)
    expect(subject.bank_statement).to eq ("date || credit || debit || balance \n #{Date.today} ||  || 1 || 0 \n #{Date.today} || 1 ||  || 1")
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




end
