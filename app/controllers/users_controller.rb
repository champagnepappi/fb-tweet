class UsersController < ApplicationController
  before_action :logged_in_user, except: [:new ,:create]
  before_action :already_logged_in, only: :new
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # log_in @user
      # UserMailer.account_activation(@user).deliver_now
      @user.send_activation_email
      flash[:success] = "Check your email to activate your account"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @video = current_user.videos.build
    @videos = @user.videos
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
      flash[:success] = "Profile Successfully Updated"
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:f_name,:l_name,:email,:password,:password_confirmation)
  end
  
  def already_logged_in
    if current_user
      redirect_to root_url
      flash[:message] = "You are signed up"
    end
  end

  def correct_user
    @user = User.find_by(id: params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

end

