class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Logged in!"
      redirect_to root_url

    else
      flash.now[:danger] = "Email or Password is invalid!"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
     flash[:info] = "Logged out!"
    redirect_to root_url
  end
end
