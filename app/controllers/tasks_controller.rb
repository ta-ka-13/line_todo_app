class TasksController < ApplicationController
  def index
    @Tasks = Task.all
  end
end
