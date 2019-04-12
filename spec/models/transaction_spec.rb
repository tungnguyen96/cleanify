require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:transaction) { Transaction.new(amount: 10) }

  it 'must have amount' do
    transaction.amount = nil
    expect(transaction).not_to be_valid
  end

  it 'amount must be integer' do
    transaction.amount = 'a'
    expect(transaction).not_to be_valid
  end

  it 'must have complete' do
    transaction.complete = nil
    expect(transaction).not_to be_valid
  end

  it 'incompleted as default' do
    expect(Transaction.new).not_to be_complete
  end
end
