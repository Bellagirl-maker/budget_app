require 'rails_helper'

describe User, type: :model do
  subject { User.new(name: 'Nathan', email: 'nathan@gmail.com', password: '123456', password_confirmation: '123456') }

  before { subject.save }

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'should not be valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should not be valid without a email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end
