class TasksController < ApplicationController
  before_action :require_login
  before_action :set_task, only: [:edit, :show, :update, :destroy]
  def index
    @tasks = current_user.tasks
    @total_tasks = @tasks.count
    @completed_tasks = @tasks.where(completed: true).count
    @incomplete_tasks = @total_tasks - @completed_tasks
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to tasks_path , notice: "tasks created successfully"
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  
  end

  def show
    
  end

  def update
   if @task.update(task_params)
    redirect_to tasks_path, notice: "tasks updated successfully"
   else
    render :edit ,status: :unprocessable_entity
   end
  end
  def destroy
     @task.destroy
    redirect_to tasks_path, notice: "Task deleted successfully!"
  end
  private
   def set_task
    @task = current_user.tasks.find(params[:id])
   rescue ActiveRecord::RecordNotFound
    redirect_to tasks_path, alert: "Task not found or not authorized."
   end

  def task_params
    params.require(:task).permit(:task_name, :completed)
  end
end
