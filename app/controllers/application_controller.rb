class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def authorize_user
    redirect_to login_path, alert: "You need an account to do that." if current_user.nil?
  end
  def current_user
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end
  def logged_in
    current_user != nil
  end  
end
