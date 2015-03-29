Rails.application.routes.draw do

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
