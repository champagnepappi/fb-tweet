class SessionsController < ApplicationController
  before_action :already_logged_in , except: :destroy
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message = "Account not activated"
        message += "Check email for activation link"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = "Invalid email and password combination"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private
  def already_logged_in
    if current_user
      redirect_to root_url
      flash[:message] = "You are already logged in"
    end
  end
end
