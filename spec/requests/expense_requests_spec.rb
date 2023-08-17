require 'rails_helper'

describe ExpensesController, type: :request do
  before(:each) do
    @user = User.create(name: 'Nathan', email: 'nathan@gmail.com', password: 'abcdefgh',
                        password_confirmation: 'abcdefgh')
    @category = Category.create(author: @user, name: 'Pizza', icon: 'https://pizza.png')
    @expense = Expense.new(author: @user, name: 'Car', amount: 10_000)
  end

  describe 'authenticated user pages' do
    before(:each) do
      sign_in @user
      get new_category_expense_path(@category.id)
    end

    it 'should render the new action correctly' do
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response).to render_template('expenses/new')
    end

    it 'should render the details of the page' do
      expect(response.body).to include('NEW TRANSACTION')
      expect(response.body).to include(@category.name)
      expect(response.body).to include('Save Transaction')
    end
  end
end
