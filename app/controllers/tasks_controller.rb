class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @tasks = Task.find(params[:id])
  end

  def new
    @tasks = Task.new
  end

  def create 
    @tasks = Task.new(task_params)
    @tasks.save
    redirect_to task_path(@tasks)
  end

  def edit
    @tasks = Task.find(params[:id])
  end

  def update
    @tasks = Task.find(params[:id])
    @tasks.update(task_params)
    redirect_to task_path(@tasks)
  end

  def destroy
    @tasks = Task.find(params[:id])
    @tasks.delete
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
