RailsBlogChallengeNick::Application.routes.draw do
  root 'posts#index'
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  resources :posts, only: [:index, :show]
  resources :users do
    resources :posts, only: [:new, :create, :edit, :destroy]
  end


end
