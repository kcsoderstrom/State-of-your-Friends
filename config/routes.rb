Rails.application.routes.draw do
  root to: "application#welcome"
  get '/auth/facebook/callback', to: 'oauth_callbacks#facebook'
  resource :result, only: [:show, :create]
  resource :survey, only: [:show]
  get '/survey/:id', to: 'surveys#swap_current_question'
  resource :session, only: [:create, :destroy]
  resources :responses, only: [:create]
  resources :users, only: [:update]
end
