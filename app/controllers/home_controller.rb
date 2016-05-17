class HomeController < ApplicationController
  def index
    if current_user
      @user = current_user
      @tasks = @user.tasks
    end
    render :index
  end
end
