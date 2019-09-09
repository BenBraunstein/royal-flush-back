Rails.application.routes.draw do
  resources :duties
  resources :locations
  resources :users

  post '/signup', to: 'users#create'
  post 'login', to: 'auth#login'
  get 'autologin', to: 'auth#autologin'

end
