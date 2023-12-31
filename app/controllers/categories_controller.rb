class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.categories
  end

  def show
    @category = current_user.categories.find(params[:id])
    @expenses = @category.expenses.order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Category created successfully'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
