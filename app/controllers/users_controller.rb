class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      flash[:success] = "Thanks for singing up! =)"
      redirect_to user_path(@user)
    else
      flash[:error] = "Looks like that email is alreasy in-use! 😤"
      redirect_to sign_up_path
    end
  end

  def show
  end

  def edit

  end

  def update
    @user.update(user_params)
    redirect_to @user
  end

  def delete
    @user.delete
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
