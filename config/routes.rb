Rails.application.routes.draw do
  post '/signup', to: 'users#create'
  post '/signin', to: 'users#signin'
  resources :tracks
end
