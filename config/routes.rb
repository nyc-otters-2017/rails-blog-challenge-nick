RailsBlogChallengeNick::Application.routes.draw do
  root 'users#index'
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  resources :users

end
