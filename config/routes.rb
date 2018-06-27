Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :books, only: [:index, :show] do
    collection do
      get 'book_info'
    end
  end
  resources :users do
    resource :rent, only: [:create, :show]
  end
  resources :book_suggestions, only: [:create]

  get '/:book_id/suggestions', to: 'books#suggestions'
  get '/users/:user_id/rents', to: 'rents#index'
  get '/books/:book_id/rents', to: 'rents#index'
end
