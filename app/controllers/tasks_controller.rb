class TasksController < ApplicationController

  # before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    
  end

  def edit
    @task = Task.find(params[:id])
  end


  def show

  end


  def update
    task = Task.find(params[:id])
    task.task = params[:task]
    if task.save
      redirect_to tasks_index_path,
        notice: "タスクを１件更新しました"
    else
      redirect_to tasks_index_path,
        alert: "タスクの更新に失敗しました"
    end
  end

  def delete
    task = Task.find(params[:id])
    if task.destroy
      redirect_to tasks_index_path,
        notice: "タスクを１件削除しました"
    else
      redirect_to tasks_index_path,
        alert: "タスクの削除に失敗しました"
    end
  end

end