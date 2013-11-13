class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      login_user(user)
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