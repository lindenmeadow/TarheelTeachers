Rails.application.routes.draw do
  resources :users, :forums, :comments, :discussions
  
  resources :discussions, only: [:show] do
    resources :comments
  end
 
  root to: "home#index"

  get 'sessions/new'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/users/:id' => 'users#show'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'


  get '/auth/facebook/callback' => 'sessions#create'
end
