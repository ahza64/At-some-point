class SessionsController < ApplicationController

  def create
    user_params = params.require(:user).permit(:email, :password)
    @user = User.confirm(user_params)
    if @user
      login(@user)
      redirect_to @user
    else
      flash[:error] = "No user found!"
      redirect_to home_path
    end
  end

  def destroy
    logout  
    flash[:notice] = "Successfully logged out."
    redirect_to home_path
  end
  def testing
    1+2
  end

end
