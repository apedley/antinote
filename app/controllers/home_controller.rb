class HomeController < ApplicationController
  respond_to :json, :only => :preview
  before_filter :authorize_user, only: [:preview, :dashboard]

  def dashboard
    @notes = Note.all
    @categories = Category.all
  end

  def setup
    if User.count > 0 
      redirect_to login_path
    else
      @user = User.new
      render :layout => false
    end
  end

  def create
    @user = User.new
    if @user.update_attributes(user_create_params)
      if Category.count < 1
        @category = Category.new(name: 'Uncategorized')
        @category.save
      end
      redirect_to login_path, notice: "Created"
    else
      render "setup"
    end
  end

  def preview
    @preview = Note.format_text(params[:text])
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { respond_with @preview.to_json }
    end

  end

  def share
  end

  private

  def user_create_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
