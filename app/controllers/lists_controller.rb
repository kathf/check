class ListsController < ApplicationController
  before_action :find_list, except: [ :index, :new, :create, :due_this_week]
  before_action :find_user

  def index
    @lists = @user.lists
  end

  def new
    @list = @user.lists.new
  end

  def show
    redirect_to list_tasks_url(@list)
  end

  def create
    @list = @user.lists.new(list_params)
    if @list.save
      redirect_to lists_url, notice: "Created #{@list.name}"
    else
      render :new
    end
  end

  def update
    if @list.update_attributes(list_params)
      redirect_to lists_path, notice: "List updated"
    else
      render :edit
    end
  end

  def due_this_week
    @tasks = @user.tasks.due_within(1.week.from_now)
  end

  def destroy
    @list.destroy
    redirect_to lists_url
  end

  private
    def list_params
      params.require(:list).permit(:name)
    end

    def find_list
      @list = List.find(params[:id])
    end

    def find_user
      @user = current_user
    end
end
