require 'rails_helper'

describe Expense, type: :model do
  subject do
    @user = User.new(name: 'Nathan', email: 'nathan@gmail.com', password: '123456', password_confirmation: '123456')
    Expense.new(author: @user, name: 'Pizza', amount: 100)
  end

  before { subject.save }

  it 'is not valid without an author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end
end
