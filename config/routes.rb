# Routes
Rails.application.routes.draw do

  get '/users/new' => 'users#new'

  get '/sessions/new' => 'sessions#new'

  get '/users/:id' => 'users#show'

  post '/sessions' => 'sessions#create'

  post '/users' => 'users#login'

  post '/users/:id/comment' => 'users#comment'

  post '/users/:id/like' => 'users#like'

  delete '/sessions' => 'sessions#destroy'

  delete '/users/:id' => 'users#destroy'



  
end
