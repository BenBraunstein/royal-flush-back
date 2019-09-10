Rails.application.routes.draw do
  resources :duties
  resources :locations
  resources :users

  get '/recent_duties/:id', to: 'duties#recent_duties'
  post '/signup', to: 'users#create'
  post 'login', to: 'auth#login'
  get 'autologin', to: 'auth#autologin'

end
