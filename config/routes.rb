Rails.application.routes.draw do
  resources :programs
  resources :users
  get 'signup', to: 'users#new', as: 'sign_up'
  get 'signin', to: 'sessions#new', as: 'signin'
  post 'signin', to: 'sessions#create'
  get 'logout', to: 'sessions#logout', as: 'logout'
  get '/', to: 'sessions#home', as: 'root'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
