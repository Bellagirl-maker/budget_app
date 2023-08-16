require 'rails_helper'

describe CategoryExpense, type: :model do
  User.new(name: 'Nathan', email: 'nathan@gmail.com', password: '123456', password_confirmation: '123456')
  category = Category.new(author: @user, name: 'Pizza', icon: 'https://pizza.png')
  expense = Expense.new(author: @user, name: 'Pizza', amount: 50)

  subject do
    CategoryExpense.new(category_id: category.id, expense_id: expense.id)
  end

  before { subject.save }

  it 'should have a category' do
    subject.category_id = nil
    expect(subject).to_not be_valid
  end

  it 'should have an expense' do
    subject.expense_id = nil
    expect(subject).to_not be_valid
  end
end
