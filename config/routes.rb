Rails.application.routes.draw do

  # CUSTOM ROUTES ON TOP
  
root 'welcome#home'

get '/login' => "sessions#new"
post '/sessions' => "sessions#create"
get '/logout' => "sessions#destroy"

get '/auth/:provider/callback' => 'sessions#create'
        # provider is also called 'STRATEGY'

get '/signup' => 'users#new'
        
resources :users, only: [:new, :create, :show] do
  #nested routes
  resources :events, only: [:index, :show, :new, :create]
end


resources :events
#resources :categories, except: [:destroy]
# post '/users_events', to: 'users_events#create', as: 'new_usersevent'
resources :users_events
end
