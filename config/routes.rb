Rails.application.routes.draw do

  root 'boards#index'

  devise_for :users


  resources :boards do
    resources :lists
  end

  resources :lists do
    resources :tasks
    get 'taskup/:id', to: 'tasks#up', as: 'task_up'
    get 'taskdown/:id', to: 'tasks#down', as: 'task_down'
  end

  get 'listup/:id', to: 'lists#up', as: 'list_up'
  get 'listdown/:id', to: 'lists#down', as: 'list_down'

end
