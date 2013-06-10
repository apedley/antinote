module Api
  class CategoriesController < ApplicationController
    before_action :set_note, only: [:show, :edit, :update, :destroy]
#    before_filter :authorize_api
    def index
      @categories = Category.all
    end

    def show
    end

    private

    def set_note
      @category = Category.find(params[:id])
    end

    def create_note_params
      params.require(:note).permit(:title, :body, :category_id)
    end

    def update_note_params
      params.require(:note).permit(:title, :body, :category_id)
    end  
  end
end