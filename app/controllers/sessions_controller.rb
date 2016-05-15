class SessionsController < ApplicationController
<<<<<<< HEAD
   def new
     @user = User.new
     render :new
   end

   def create
     user_params = params.require(:user).permit(:email, :password)
     @user = User.confirm(user_params)
     if @user
       login(@user)
       redirect_to @user
     else
       redirect_to home_path
     end
   end

   def destroy    #destroy user login
     logout   #see in sessions helper
     redirect_to home_path
   end
   def testing
      1+2
   end

end
