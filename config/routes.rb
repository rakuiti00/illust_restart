Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  #lgtm to: 'users#lgtm'
  resources :posts do
    resources :likes, only: [:create,:destroy]
    resources :comments, only: [:create,:destroy]
  end

  resources :users, only: [:show]
  resources :tranings, only: [:index,:new,:create]

end
