Rails.application.routes.draw do
  
 get '/signup' =>'users#new'
 post '/signup' =>'users#create'
 root 'game_share#home'
 get '/help' =>'game_share#help'
 get '/login' =>'sessions#new'
 post '/login' =>'sessions#create'
 delete '/logout' =>'sessions#destroy'

 resources :users do
  member do
    get :following, :followers
  end
end
 resources :account_activations, only: [:edit]
 resources :password_resets,     only: [:new, :create, :edit, :update]
 resources :microposts,          only: [:index, :show, :create, :destroy]
 resources :relationships,       only: [:create, :destroy]
 resources :likes,               only: [:create, :destroy]
 resources :comments,            only: [:create, :destroy]
end