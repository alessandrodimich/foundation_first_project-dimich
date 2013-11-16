class PasswordResetsController < ApplicationController

  before_filter :verify_if_signed_in, only: [ :edit, :create ]

  def new
    @title = "Reset Password"
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
      @user.password_confirmation = params[:user][:password_confirmation]
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

private

  def verify_if_signed_in
    if current_user
      flash[:info] = "You are already logged in, Please change your password from the settings page"
      redirect_to root_url #or to the profile page
    end
  end

end
