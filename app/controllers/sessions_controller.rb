class SessionsController < ApplicationController
  def new
    unless current_user
      @title = "Sign in"
    else
      flash[:info] = "You are already signed in"
      redirect_to root_url
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      login_user(user, params[:remember_me])
      flash[:success] = "Logged in!"
      redirect_to root_url

    else
      flash.now[:danger] = "Email or Password is invalid!"
      render "new"
    end
  end

  def destroy
    logout_user
    flash[:info] = "Logged out!"
    redirect_to root_url
  end
end
