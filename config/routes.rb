Rails.application.routes.draw do

get 'sessions/new'

resources :users

resources :tweets
get '/signup', to: 'users#new'

get '/login', to: 'sessions#new', as: 'login'
post '/login', to: 'sessions#create', as: 'create_session'
get '/logout', to: 'sessions#destroy', as: 'logout'

root 'tweets#index'
end
