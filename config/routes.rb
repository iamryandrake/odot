Rails.application.routes.draw do

  devise_for :users
  get 'pages/home'

  resources :todo_lists do
    resources :todo_items do
      member do
        patch :complete
      end
    end
  end
  root 'pages#home'
end
