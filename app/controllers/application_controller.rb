class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private

  def current_user
    @current_user ||= User.find_by(auth_token: session[:auth_token]) if session[:auth_token]
  end
  helper_method :current_user #To make the method also available in the views

  def authorize
    if current_user.nil?
      flash[:danger] = "Not authorized, please login first"
      redirect_to login_url
    end
  end

  def login_user(user)
    session[:auth_token] = user.auth_token
  end

  def logout_user
    session[:auth_token] = nil
  end

end
