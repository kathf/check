class TasksController < ApplicationController
  before_action :find_list
  before_action :find_tasks, only: [ :index, :create ]

  def index
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.valid?
      @list.tasks << @task
      redirect_to list_tasks_url(@list), notice: 'Added Task'
    else
      render :index
    end
  end

  def destroy
    @task = @list.tasks.find(params[:id])
    @task.destroy
    redirect_to list_tasks_url(@list), notice: 'Deleted Task'
  end

  private
    def find_list
      @list = List.find(params[:list_id])
    end

    def find_tasks
      @tasks = @list.tasks
    end

    def task_params
      params.require(:task).permit(:description)
    end
end
