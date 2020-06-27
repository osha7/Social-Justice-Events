Rails.application.routes.draw do
  
root 'welcome#home'

resources :users
get '/signup', to: 'users#new'

resources :events

get '/login' => "sessions#new"
post '/sessions' => "sessions#create"
get '/logout' => "sessions#destroy"

get '/auth/:provider/callback' => 'sessions#create'
        # provider is also called 'STRATEGY'

end
