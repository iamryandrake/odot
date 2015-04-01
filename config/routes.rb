Rails.application.routes.draw do
  namespace :api do
    resources :todo_lists do
      resources :todo_items, only: [:create, :update, :destroy]
    end
  end

  devise_for :users
  get 'pages/home'

  get '/login' => 'user_sessions#new', as: :login
  delete '/logout' => 'user_sessions#destroy', as: :logout

  resources :todo_lists do
    resources :todo_items do
      member do
        patch :complete
      end
    end
  end
  root 'pages#home'
end
