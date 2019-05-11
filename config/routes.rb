Rails.application.routes.draw do
  get 'users/new'

  get 'users/create'

  get 'users/destroy'

  get 'user/new'

  get 'user/createdestroy'

  get 'sessions/user'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    root to: 'tasks#index'
    
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    get 'signup', to: 'users#new'
    resources :tasks
    resources :users, only: [:new, :create]
    # resources :users do
    #   resources :tasks
    # end
end
