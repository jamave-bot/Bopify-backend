Rails.application.routes.draw do
  resources :songs, only: [:create, :destroy]
  resources :playlists, only: [:create, :destroy, :index]
  resources :users, only: [:index, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post "/login", to: "users#login"
  get "/me", to: "users#me"
end
