require 'bank'

describe Bank do

  it 'responds to check balance' do
    expect(subject).to respond_to :check_balance
  end

end
