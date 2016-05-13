class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    user_params = params.require(:user).permit(:username, :email, :password, :location)
    @user = User.create(user_params)
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

end
