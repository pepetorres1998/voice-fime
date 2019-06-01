Rails.application.routes.draw do
  resources :sessions
  resources :users

  get '/log_in', to: 'users#log_in'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
