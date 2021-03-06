class SessionsController < ApplicationController
  def new
    if User.count == 1
      render :layout => false
    else
      redirect_to home_setup_path
    end
    
  end

  def create
    user = User.first
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] =  user.auth_token
      end

      redirect_to root_url, :alert => "logged in successfully"
    else
      flash[:error] = "Invalid password"
      render "new", :layout => false
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to login_url, :alert => "Logged out"
  end
end
