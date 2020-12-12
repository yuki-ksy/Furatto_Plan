Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get '/about' => 'homes#about', as: 'about'

  resources :tourisms
  resources :comments, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :genres
  resources :images
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
