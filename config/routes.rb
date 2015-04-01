Rails.application.routes.draw do
  namespace :api do
    resources :todo_lists, only: [:index, :show, :create, :update, :destroy] do
      resources :todo_items, only: [:create, :update, :destroy]
    end
  end

  get 'pages/home'

  # get '/login' => 'user_sessions#new', as: :login
  # delete '/logout' => 'user_sessions#destroy', as: :logout

  resources :todo_lists do
    resources :todo_items do
      member do
        patch :complete
      end
    end
  end
  root 'pages#home'
end
