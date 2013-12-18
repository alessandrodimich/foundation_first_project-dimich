class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private

  def current_user
    @current_user ||= User.find_by(auth_token: cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_user #To make the method also available in the views

  def authorize
    if current_user.nil?
      flash[:warning] = "Not authorized, please login first"
      redirect_to login_url
    end
  end

  def login_user(user, remember_me)

    user.generate_auth_token
    if remember_me
      cookies.permanent[:auth_token] = user.auth_token
      cookies.permanent[:star_token] = user.star_token
    else
      cookies[:auth_token] = user.auth_token
      cookies.permanent[:star_token] = user.star_token
    end
  end

  def logout_user
    cookies.delete(:auth_token)
  end


  def verify_if_signed_in
    if current_user
      flash[:info] = "You are currently signed in"
      redirect_to root_url #or to the profile page
    end
  end

    def verify_if_not_signed_in
    unless current_user
      flash[:warning] = "you need to be signed in !!"
      redirect_to root_url #or to the profile page
    end
  end


end
