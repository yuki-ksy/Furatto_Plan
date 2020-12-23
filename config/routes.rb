Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get '/about' => 'homes#about', as: 'about'
  get 'users/unsubscribe'
  resources :users
  put "/users/:id/hide" => "users#hide", as: 'users_hide'


  resources :tourisms do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :genres
  #resources :images


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
