class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_filter :authorize_user
  def show
    @category = @note.category
    @notes = @category.notes
  end

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
    @categories = Category.all
    @note.category = Category.first
  end

  def create
    @note = Note.new(create_note_params)

    if @note.save
      redirect_to @note, notice: "Note created."
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @note.update(update_note_params)
      redirect_to @note, notice: 'Note was updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_url, notice: 'Note was destroyed.'
  end


  private

  def set_note
    @note = Note.find(params[:id])
  end


  def create_note_params
    params.require(:note).permit(:title, :body, :category_id)
  end

  def update_note_params
    params.require(:note).permit(:title, :body, :category_id)
  end

end