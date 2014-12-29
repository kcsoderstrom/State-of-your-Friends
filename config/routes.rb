Rails.application.routes.draw do
  root to: "application#welcome"
  get '/auth/facebook/callback', to: 'oauth_callbacks#facebook'
  resource :result, only: [:show, :create]
  resource :survey, only: [:show]
  resource :session, only: [:create, :destroy]
  resources :responses, only: [:create]
end
