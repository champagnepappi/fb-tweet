class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:f_name,:l_name,:email,:password,:password_confirmation)
  end
end

