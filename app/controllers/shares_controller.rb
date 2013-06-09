class SharesController < ApplicationController
  before_filter :authorize_user, only: [:create]

  def create
    @share = Share.where("note_id = '#{params[:note_id]}'").first
    if @share
      redirect_to "/s/#{@share.uuid}"
    else
      @note = Note.find(params[:note_id])
      @share = Share.new(note: @note)
      if @share.save
        redirect_to "/s/#{@share.uuid}"
      else
        redirect_to @note, error: 'There was an error sharing your note'
      end 
    end
  end

  def show
    @share = Share.where("uuid = '#{params[:uuid]}'").first
    @note = @share.note
    render 'notes/plain', :layout => false
  end

end