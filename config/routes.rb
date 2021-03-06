Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "posts#index"
  resources :posts, only: [:index, :show]
  resources :users, only: [:show]

  namespace :admin do 
    resources :posts
    resources :users
  end
end
