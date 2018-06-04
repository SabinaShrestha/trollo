class TasksController < ApplicationController
  before_action :set_list
  before_action :set_task, only: [:edit, :update, :destroy]


  def new
    @task = Task.new
    render :form
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def edit
    render :form
  end

  def update
    if @task.update(task_params)
      redirect_to list_path(@list)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
  end

  private
    def task_params
      params.require(:task).permit(:title, :priority, :body)
    end

    def set_list
      @list = List.find(params[:list_id])
    end

    def set_task
      @task = Task.find(params[:id])
    end
end
