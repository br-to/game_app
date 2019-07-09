Rails.application.routes.draw do
 get '/'=>'game_share#home'
 get '/help' =>'game_share#help'
end