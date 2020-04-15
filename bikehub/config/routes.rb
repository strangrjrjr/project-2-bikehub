Rails.application.routes.draw do
  root to: 'session_controller#index'
  resources :comments
  resources :rides
  resources :bikes
  resources :users 
  map.connect '', :controller=>"users", :action=>"bike#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
