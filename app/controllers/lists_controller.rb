class ListsController < ApplicationController
  before_action :find_list, except: [ :index, :new, :create, :due_this_week]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show
    redirect_to list_tasks_url(@list)
  end

  def create
    @list = List.new(list_params)
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
    @tasks = Task.all.pending.due_within(1.week.from_now)
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
end
