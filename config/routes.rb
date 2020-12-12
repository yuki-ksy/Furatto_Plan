Rails.application.routes.draw do
  root 'users/homes#top'
  get '/about' => 'users/homes#about', as: 'about'
  devise_for :users
  resources :tourisms
  resources :comments, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :genres
  resources :images
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
