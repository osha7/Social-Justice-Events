Rails.application.routes.draw do

  # CUSTOM ROUTES ON TOP
  
root 'welcome#home'

get '/login' => "sessions#new"
post '/sessions' => "sessions#create"
get '/logout' => "sessions#destroy"

get '/auth/:provider/callback' => 'sessions#create'
        # provider is also called 'STRATEGY'

get '/signup' => 'users#new'
        
resources :users, only: [:new, :create, :show]
resources :events
resources :categories, except: [:destroy]

end
