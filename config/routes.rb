BooksCatalog::Application.routes.draw do

  devise_for :users

  root to: 'books#index'

  resources :books do
    resources :ratings
  end
end
