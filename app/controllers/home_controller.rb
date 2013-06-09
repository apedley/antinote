class HomeController < ApplicationController
  respond_to :json, :only => :preview
  def dashboard
    @notes = Note.all
  end

  def preview
    # params[:text] = '##heaefoijew'
    @preview = Note.format_text(params[:text])
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { respond_with @preview.to_json }
    end

  end
end
