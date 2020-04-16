Rails.application.routes.draw do
  root to: 'users#welcome'
  resources :comments, only: [:new, :edit]
  resources :rides, only: [:new, :index, :show]
  resources :bikes
  resources :users

  post '/rides/:id', to: 'rides#ride_comment', as: 'ride_comment'
  post '/bikes/:id', to: 'users#add_bike', as: 'add_bike'
  post '/rides/:id', to: 'users#add_ride', as: 'add_ride'

  get '/signup', to: 'users#new', as: 'signup'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
