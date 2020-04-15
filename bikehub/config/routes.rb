Rails.application.routes.draw do
  root to: 'users#welcome'
  resources :comments, only: [:new, :edit]
  resources :rides, only: [:new, :index, :show]
  resources :bikes
  resources :users

  post '/rides/:id', to: 'rides#ride_comment', as: 'ride_comment'

  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'users#new', as: 'login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
