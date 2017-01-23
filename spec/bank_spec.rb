require 'bank'

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

  it 'adds 1 when the method deposit money is run' do
    expect{subject.deposit_money}.to change{subject.balance}.by(1)
  end

end
