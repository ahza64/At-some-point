Rails.application.routes.draw do
  root "home#index", as: "home"
  resources :sessions, :users

  get "/users/:user_id/tasks", to: "tasks#index", as: "user_tasks"
  post "/users/:user_id/tasks", to: "tasks#create"
  get "/users/:user_id/tasks/new", to: "tasks#new", as: "new_user_task"
  get "/users/:user_id/tasks/:id/edit", to: "tasks#edit", as: "edit_user_task"
  get "/users/:user_id/tasks/:id", to: "tasks#show", as: "user_task"
  patch "/users/:user_id/tasks/:id", to: "tasks#update"
  put "/users/:user_id/tasks/:id", to: "tasks#update"
  delete "/users/:user_id/tasks/:id", to: "tasks#destroy"


  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  get "/about", to: "about_us#index"
end
