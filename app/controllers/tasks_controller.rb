class TasksController < ApplicationController
  before_action :find_list
  before_action :find_task, only: [ :destroy, :complete, :edit, :update ]
  before_action :find_tasks, only: [ :index, :create, :completed_index, :complete_me ]

  def index
    @tasks = @tasks.incompleted_tasks
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

  def update
    if @task.update_attributes(task_params)
      redirect_to list_tasks_path(@list), notice: "Task updated"
    else
      render :edit
    end
  end

  def complete
    @task.complete!
    redirect_to list_tasks_path(@list), notice: "#{@task.description} completed"
  end

  def completed_index
    @tasks = @tasks.completed_tasks
  end

  def destroy
    @task.destroy
    redirect_to list_tasks_url(@list), notice: 'Deleted Task'
  end

  private
    def find_list
      @list = List.find(params[:list_id])
    end

    def find_task
      @task = @list.tasks.find(params[:id])
    end

    def find_tasks
      @tasks = @list.tasks
    end

    def task_params
      params.require(:task).permit(:description, :due_at, :priority, :completed, :complete, :category)
    end
end
