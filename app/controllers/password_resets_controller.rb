class PasswordResetsController < ApplicationController
  def new
    unless current_user
      @title = "Reset Password"
    else
      flash[:info] = "Please change your password from the settings page"
      redirect_to root_url #or to the profile page
    end
  end

  def create
    user = User.find_by(email: params[:email])
    user.send_password_reset if user
    flash[:info] = "An email has been sent to your account with password reset instructions"
    redirect_to root_url
  end

  def edit
    begin
      @user = User.find_by! password_reset_token: params[:id]
    rescue
      flash[:warning] = "Sorry, something went wrong!"
      redirect_to root_url
    end
  end

  def update

    @user = User.find_by! password_reset_token: params[:id]
    if @user
      @user.password = params[:user][:password]
    end
    if @user.password_reset_sent_at < 2.hours.ago
      flash[:warning] = "Password reset has expired, please re-submit your email"
      redirect_to reset_password_path
    elsif @user.save
      login_user(@user, "remember_me_yes")
      flash[:success] = "Your password has been reset!"
      redirect_to root_url
    else
      render "edit"
    end
  end
end
