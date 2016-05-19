class TasksController < ApplicationController

  def new
    @task = Task.new
    @user = User.find(params[:user_id])
    if current_user
      render :new
    else
      flash[:error] = "Could not create task"
      redirect_to home_path #change to login page when we make it see jon
    end
  end

  def create
    @task = Task.create(task_params)
    @user = current_user
    @user.tasks << @task
    flash[:success] = "Task created!"
    redirect_to user_path(@user)
  end

  def edit
    @task = Task.find(params[:id])
    @user = @task.user
    if current_user == @user
      render :edit
    else
   flash[:error] = "Must log in to edit!"
      redirect_to home_path #update to login see Jon
    end
  end

  def update
    @user = User.find(params[:user_id])
    @task = Task.find(params[:id])
    @task.update(task_params)
    flash[:success] = "Task update complete!"
    redirect_to @user
  end

  def destroy
    @task = Task.find(params[:id])
    @user = @task.user
    if current_user == @user
      @user.tasks.destroy(@task)
      flash[:success] = "Task deleted!"
      redirect_to @user
    else
      flash[:error] = "Must log in to delete task"
      redirect_to home_path
    end
  end


  private

  def task_params
    params.require(:task).permit(:name, :location)
  end

end
