class SessionsController < ApplicationController

  def home
  end

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if User.find_by(email: params[:email]) && User.authenticate(email: params[:email], password: params[:password])
      session[:id] = @user.id
      flash[:login] = "Nice! Welcome back #{@user.name} 😘"
      redirect_to user_path(@user)
    else
      flash[:error] = "Looks like we couldn't verify your information"
      redirect_to login_path
    end
  end

  def logout
    session[:id] = nil
    flash[:logout] = "Successfully logged out! See you soon, we hope!"
    redirect_to root_path
  end
end
