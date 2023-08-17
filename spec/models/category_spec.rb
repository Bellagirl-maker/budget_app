require 'rails_helper'

describe Category, type: :model do
  subject do
    User.new(name: 'Nathan', email: 'nathan@gmail.com', password: '123456', password_confirmation: '123456')
    Category.new(author: @user, name: 'pizza', icon: 'https://pizza.png')
  end

  before { subject.save }

  it 'should not be valid without an author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'should not be valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should not valid without an icon' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end
