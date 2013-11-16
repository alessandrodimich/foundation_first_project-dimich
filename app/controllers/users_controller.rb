class UsersController < ApplicationController

  layout 'basic', only: :new

  before_filter :verify_if_signed_in, only: [:new, :create]

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new

    @user = User.new
    @title = "Sign up"
  end

  def create
    @user = User.new(user_params)
    @user.password_confirmation = @user.password if @user.password
    if @user.save
      login_user(@user, "remember_me_yes")
      flash[:success] = "Thank you for signing up!"
      redirect_to root_url
    else

      render "new", layout: 'basic'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.

    def user_params
      params.require(:user).permit(:first_name, :last_name, :user_name, :email, :password)
    end

  end
