Rails.application.routes.draw do
  root to: 'users#index'

  resources :users, only: [:index]
  resources :profiles, only: [:show]
  delete '/logout', to: 'sessions#destroy'

  get '/auth/twitter', as: 'twitter_login'
  get 'auth/github', as: 'github_login'
  get "/auth/github/callback" => "sessions#create"
end
