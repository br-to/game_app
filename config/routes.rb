Rails.application.routes.draw do
  get '/signup' =>'users#new'
 root 'game_share#home'
 get '/help' =>'game_share#help'
end