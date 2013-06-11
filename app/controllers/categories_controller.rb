class CategoriesController < ApplicationController
  before_action :set_category, only: [ :show, :destroy, :update, :edit ]
  before_filter :authorize_user
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(create_category_params)

    if @category.save
      redirect_to @category, notice: "Category created"
    else
      render 'new'
    end
  end

  def show
    @notes = @category.notes
  end

  def index
    @categories = Category.all
  end

  def destroy
    if Category.count == 1
      redirect_to @category, notice: "At least one category is required"
    else
      @category.destroy
      redirect_to categories_url, notice: 'Category was destroyed.'
    end
  end

  def edit
  end

  def update
    if @category.update(update_category_params)
      redirect_to @category, notice: 'Category was updated.'
    else
      render 'edit'
    end
  end
  private

  def set_category
    @category = Category.find(params[:id])
  end
  def create_category_params
    params.require(:category).permit(:name)
  end
  def update_category_params
    params.require(:category).permit(:name)
  end
end