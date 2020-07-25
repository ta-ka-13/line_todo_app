class TasksController < ApplicationController
  def index
    @tasks = Task.all
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
