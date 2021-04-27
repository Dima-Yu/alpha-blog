class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  before_action :require_admin, except: %i[show]
  def new
    @category = Category.new
  end

  def show
    @pagy, @articles = pagy(@category.articles, items: 8)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'Category saved successfully'
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      flash[:notice] = 'Category name was updated'
      redirect_to @category
    else
      render 'edit'
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    unless logged_in? && current_user.admin?
      flash[:alert] = 'Only admins can perform that action'
      redirect_to articles_path
    end
  end
end
