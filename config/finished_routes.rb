Rails.application.routes.draw do
  resources :programs
  resources :users
  get '/logout', to: 'sessions#logout', as: 'logout'
  get '/signup', to: 'users#new', as: 'sign_up'
  get '/signin', to: 'sessions#new', as: 'login'
  post '/signin', to: 'sessions#create'
  root 'sessions#home'
  get '/', to: 'sessions#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
