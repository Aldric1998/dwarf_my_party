Rails.application.routes.draw do
  devise_for :users
  # resources :dwarves

  resources :dwarves, only: %i[index show new create] do
    resources :offers, only: %i[new create]
  end
  resources :offers, only: %i[destroy] do
    resources :reviews, only: %i[new create]
  end

  resources :reviews, only: %i[destroy]

  root to: 'pages#home'
end
  # get 'dwarves/index'
  # get 'dwarves/new'
  # get 'dwarves/create'
  # get 'dwarves/show'
  # get 'dwarves/edit'
  # get 'dwarves/update'
  # get 'dwarves/destroy'

  # get 'users/new'
  # get 'users/create'
  # get 'users/index'
  # get 'users/show'
  # get 'users/edit'
  # get 'users/update'
  # get 'users/destroy'
  # get 'reviews/index'
  # get 'reviews/show'
  # get 'reviews/new'
  # get 'reviews/create'
  # get 'reviews/edit'
  # get 'reviews/update'
  # get 'reviews/destroy'
  # get 'offers/index'
  # get 'offers/show'
  # get 'offers/new'
  # get 'offers/create'
  # get 'offers/edit'
  # get 'offers/update'
  # get 'offers/destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
