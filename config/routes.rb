Rails.application.routes.draw do
  root to: "tasks#index"
  get "tasks/filter/:filter" => "tasks#index", as: :filtered_tasks
  resources :tasks, only: [:index, :new, :create, :destroy]
end
