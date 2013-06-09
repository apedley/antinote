class CategoriesController < ApplicationController
  before_action :set_category, only: [ :show ]
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


  private

  def set_category
    @category = Category.find(params[:id])
  end
  def create_category_params
    params.require(:category).permit(:name)
  end

end