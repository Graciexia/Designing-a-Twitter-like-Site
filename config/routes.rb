Rails.application.routes.draw do

get 'welcome/index'
get 'welcome/about', as: 'about'

resources :users

resources :tweets

root 'welcome#index'
end
