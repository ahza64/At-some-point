Rails.application.routes.draw do
  root "home#index", as: "home"
  resources :tasks, :users, :sessions

  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"

end
