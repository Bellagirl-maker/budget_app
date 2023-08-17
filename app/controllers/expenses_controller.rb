class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def new
    @expense = Expense.new
    @categories = Category.where(author_id: current_user.id).includes([:author]).order(created_at: :desc)
    @selected_category = Category.find(params[:category_id])
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.author = current_user

    if @expense.save
      params[:category_ids].each do |id|
        CategoryExpense.create(category_id: id.to_i, expense_id: @expense.id)
      end
      redirect_to category_path(params[:category_id]), notice: 'Transaction added successfully'
    else
      render :new, status: 422
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
