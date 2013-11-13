class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
    @title = "Sign up"
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login_user(@user)
      flash[:success] = "Thank you for signing up!"
      redirect_to root_url
    else
      render "new"
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
