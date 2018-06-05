Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :books, only: [:index, :show]
  # resources :rents, only: [:index, :create]

  get '/users/:user_id/rents', to: 'rents#index'
  get '/books/:book_id/rents', to: 'rents#index'
  post '/users/:user_id/rents', to: 'rents#create'

end
