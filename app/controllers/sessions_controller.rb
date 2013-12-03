class SessionsController < ApplicationController


  before_filter :verify_if_signed_in, except: :destroy

  def new
    @title = "Sign in"
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      login_user(user, params[:remember_me])
      flash[:success] = "Logged in!"
      redirect_to root_url

    else
      flash[:danger] = "Email or Password is invalid!"
      redirect_to login_path
    end
  end

  def destroy
    logout_user
    flash[:info] = "Logged out!"
    redirect_to root_url
  end


end
