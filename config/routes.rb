Rails.application.routes.draw do
  get 'tweets/index'

  get 'tweets/show'

  get 'tweets/new'

  get 'tweets/create'

  get 'tweets/edit'

  get 'tweets/update'

  get 'tweets/destroy'

  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/create'

  get 'users/edit'

  get 'users/update'

  get 'users/destroy'

  get 'welcome/index'

get 'welcome/index'

resources :users

resources :tweets

root 'welcome#index'
end
