Rails.application.routes.draw do
  
  get 'password_resets/new'
  get 'password_resets/edit'
  get '/signup' =>'users#new'
  post '/signup' =>'users#create'

 root 'game_share#home'
 get '/help' =>'game_share#help'
 
 get '/login' =>'sessions#new'
 post '/login' =>'sessions#create'
 delete '/logout' =>'sessions#destroy'

 resources :users
 resources :account_activations, only: [:edit]
 resources :password_resets,     only: [:new, :create, :edit, :update]
 resources :microposts,          only: [:create, :destroy]
end