class TasksController < ApplicationController

  def new
    @task = Task.new
    @user = User.find(params[:user_id])
    if current_user
      render :new
    else
      #flash see john
      redirect_to home_path #change to login page when we make it see Jon
    end
  end

  def create
    @task = Task.create(task_params)
    @user = current_user
    @user.tasks.unshift(@task)
    redirect_to user_path(@user)
  end

  def edit
    @task = Task.find(params[:task_id])
    @user = @task.user
    if current_user == @user
      render :edit
    else
      # flash see john
      redirect_to home_path #update to login see Jon
    end
  end

  def update
    @task = Task.find(params[:task_id])
    @task.update(task_params)
    #flash see john
    redirect_to @user
  end

  def destroy
    @task = Task.find(params[:task_id])
    @user = @task.user
    if current_user == @user
      @user.tasks.destroy(@task)
      #flash see john
      redirect_to @user
    else
      #flash see john
      redirect_to home_path #update to login see Jon
    end
  end

  private
  def task_params
    params.require(:task).permit(:name, :location)
  end

end
