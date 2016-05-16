class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.create(user_params)
    login(@user)
    redirect_to user_path(@user)
  end

  def show
    @user = User.find_by_id(params[:id])
    @tasks = @user.tasks
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :location, :image)
  end

end
