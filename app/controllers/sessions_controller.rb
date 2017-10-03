class SessionsController < ApplicationController

  def home
  end

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:id] = user.id
      flash[:success] = "Nice! Welcome back #{user.name} 😘"
      redirect_to user_path(user)
    else
      flash[:error] = "Looks like we couldn't verify your information"
      redirect_to signin_path
    end
  end

  def logout
    session[:id] = nil
    flash[:success] = "Successfully logged out! See you soon, we hope!"
    redirect_to root_path
  end
end
