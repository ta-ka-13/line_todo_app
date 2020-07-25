Rails.application.routes.draw do
  get 'tasks/index'
  delete 'tasks/:id/delete' => 'tasks#delete',  as: "task_delete"
  post 'line/bot'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
