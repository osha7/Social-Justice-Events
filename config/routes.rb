Rails.application.routes.draw do
  
root 'welcome#home'

resources :users
resources :events

get '/login' => "sessions#new"
post '/sessions' => "sessions#create"
get '/logout' => "sessions#destroy"

end
