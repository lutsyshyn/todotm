class TasksController < ApplicationController

  respond_to :html

  before_filter :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.task_index
    respond_with @tasks
  end

  def show
    respond_with @task
  end

  def new
    @task = Task.new
    respond_with @task
  end


  def edit
    respond_with @task
  end

  def create
    @task = Task.new(params[:task])
    @task.user_id = current_user.id

    if @task.save
      flash[:success] = 'Task was successfully created.'
    end

    respond_with @task
  end

  def update

    flash[:success] = 'Task was successfully updated.' if @task.update_attributes(params[:task])

    respond_with @task
  end

  def destroy
    flash[:success] = 'Task deleted' if @task.destroy
    respond_with @task
  end

  private

    def find_task
      @task = Task.find(params[:id])
    end

end
