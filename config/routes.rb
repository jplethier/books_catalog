BooksCatalog::Application.routes.draw do

  devise_for :users

  root to: 'books#index'
end
