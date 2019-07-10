Rails.application.routes.draw do
  get '/signup' =>'users#new'
  post '/signup' =>'users#create'
 root 'game_share#home'
 get '/help' =>'game_share#help'
 resources :users
end