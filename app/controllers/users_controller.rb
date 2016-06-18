class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.create(user_params)
    if @user.image == ""
      @user.image = "photo.jpg"
    end
    if @user.save
      login(@user)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    @tasks = @user.tasks
    if current_user == @user
      render :show
    else
      redirect_to home_path
    end

  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :location, :image)
  end

end
