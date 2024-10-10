class TasksController < ApplicationController
    def index
      @tasks = Task.where(status: 'incomplete')
      @task = Task.new
    end
  
    def create
      @task = Task.new(task_params)
      @task.status = 'incomplete'
  
      if @task.save
        redirect_to tasks_path, notice: 'สร้างงานใหม่เรียบร้อยแล้ว'
      else
        render :index, status: :unprocessable_entity
      end
    end
  
    def complete
      @task = Task.find(params[:id])
      @task.update(status: 'complete')
      redirect_to tasks_path, notice: 'งานถูกทำเครื่องหมายว่าเสร็จสมบูรณ์แล้ว'
    end
  
    private
  
    def task_params
      params.require(:task).permit(:status)
    end
  end
  
